var rootURL = "http://localhost/WebAppProject1/api/recipes";
var currentRecipe;


$(document).ready(function () {
    //get all data on start
    findAll();

    //filter by category
    $(document).on("change", '#categoryDropdown', function () {
        const selectedCategory = $(this).val();
        if (selectedCategory) {
            findByCategory(selectedCategory); 
        } else {
            findAll();
        }
    });

    //search by name
    $(document).on("click", '#btnSearch', function () {
        event.preventDefault();
        search($('#searchKey').val());
    });

    //display all
    $(document).on("click", '#btnShowAll', function () {
        event.preventDefault();
        findAll();
        $('#searchKey').val('');
    });

    //toggle sidebar
    $(document).on("click", '#sidebarToggle', function () {
        event.preventDefault();
        $('body').toggleClass('sb-sidenav-toggled');
        localStorage.setItem('sb|sidebar-toggle', $('body').hasClass('sb-sidenav-toggled'));

    });

    //open form
    $(document).on("click", '#btnAdd', function () {
        $('#formModal').modal('show');
        event.preventDefault();
    });

    //add new or update, same method is used
    $('#recipeForm').on('submit', function (event) {
        event.preventDefault();
        addRecipe()
    })

})

//get all recipes
var findAll = function () {
    console.log('findAll');
    $.ajax({
        type: 'GET',
        url: rootURL,
        dataType: "json",
        success: renderTable,
        error: function (xhr, status, error) {
            console.error("AJAX Error:", status, error);  
        }
    });

};

//get recipes byt its category
var findByCategory = function (category) {
    console.log('filter by ', category);

    $.ajax({
        type: 'GET',
        url: `${rootURL}/search/category/${category}`, 
        dataType: "json",
        success: function (data) {
            console.log("Recipes filtered by category:", data);
            renderTable(data); 
        },
        error: function (xhr, status, error) {
            console.error("AJAX Error:", status, error); 
            alert('Failed to fetch recipes for the selected category.');
        }
    });
};

//populating the table
var renderTable = function (data) {
    //case1: data is a JSON string
    if (typeof data === "string") {
        data = JSON.parse(data);
    }
    //case2: data is wrapped in an object 
    if (data.recipes) {
        data = data.recipes;
    }

    // convert to array if single data or will cause error in loop
    if (typeof data === "object" && !Array.isArray(data)) {
        data = [data];  // Wrap the object in an array
    }
    //check if its array 
    if (!Array.isArray(data)) {
        console.error("Expected an array but got:", data);
        return;
    }

    //clear exsiting except for table header
    const tableBody = $('#recipeTable');
    tableBody.find("tr:gt(0)").remove();
    data.forEach(item => {
        const row = `
            <tr>
                <td><button class="btnView btn btn-light" value="${item.id}">${item.name || ''}</button></td>
                <td>${item.author || 'N/A'}</td>
                <td>${item.time || 'N/A'}</td>
                <td>${item.servings || 'N/A'}</td>
                <td>${item.ingredients || 'N/A'}</td>
                <td>${item.instructions || 'N/A'}</td>
                <td><img src="${item.picture || ''}" alt="${item.name || 'Image'}" style="max-width: 100px; height: auto;"></td>
                <td>${item.category || 'N/A'}</td>
                <td><button class="btnEdit btn btn-light" value="${item.id}">Edit</button></td>
                <td><button class="btnDelete btn btn-danger" value="${item.id}">Delete</button></td>
            </tr>
        `;
        tableBody.append(row);
    });

    $('.btnView').on("click", function () {
        var recipeId = $(this).val();
        console.log("model " + recipeId);
        getRecipeById(recipeId);
    });

    $('.btnDelete').on("click", function () {
        var recipeId = $(this).val();
        deleteRecipe(recipeId);
    });

    $('.btnEdit').on("click", function () {
        var recipeId = $(this).val();
        console.log("edit this id " + recipeId);
        getRecipeToEdit(recipeId);
    });
};


//getting recipe by its id
var getRecipeById = function (id) {
    console.log('Fetching recipe by ID: ' + id);
    $.ajax({
        type: 'GET',
        url: rootURL + '/' + id,
        dataType: 'json',
        success: function (data) {
            console.log('Fetch successful: ' + data.name);
            renderRecipeModal(data);
        },
        error: function (jqXHR, textStatus, errorThrown) {
            console.error('Error fetching recipe details:', textStatus, errorThrown);
            alert('Failed to fetch recipe details. Please try again.');
        }
    });
};

// //get the id to be updated
var getRecipeToEdit = function (id) {
    console.log('Fetching recipe by ID: ' + id);
    $.ajax({
        type: 'GET',
        url: rootURL + '/' + id,
        dataType: 'json',
        success: function (data) {
            console.log('Fetch successful: ' + data.name);
            renderDetails(data)
        },
        error: function (jqXHR, textStatus, errorThrown) {
            console.error('Error fetching recipe details:', textStatus, errorThrown);
            alert('Failed to fetch recipe details. Please try again.');
        }
    });
};

//rendering the recipe modal
var renderRecipeModal = function (recipeData) {
    console.log("render model with", recipeData)

    const formattedIngredients = recipeData.ingredients.split(', ') // Split by ,
        .filter(ingredient => ingredient.trim() !== '') // Remove empty 
        .map(step => `<li>${step.trim()}</li>`) // Wrap each step in <li> tags
        .join('');

    const formattedInstructions = recipeData.instructions
        .split('. ') // Split by .
        .filter(step => step.trim() !== '') // Remove empty 
        .map(step => `<li>${step.trim()}</li>`) // Wrap each step in <li> tags
        .join('');

    //to open url in another window
    $('.modal-title').html(`<a href="${recipeData.url}" target="_blank">${recipeData.name}</a>`);
    $('#modalRecipeAuthor').text(recipeData.author);
    $('#modalRecipeTime').text(recipeData.time);
    $('#modalRecipeServings').text(recipeData.servings);
    $('#modalRecipeIngredients').html(formattedIngredients);
    $('#modalRecipeInstructions').html(formattedInstructions);
    $('#modalRecipeCategory').text(recipeData.category);
    $('#modalRecipeImage').attr('src', recipeData.picture);

    $('#viewModal').modal('show');

}

//getting the search input
var search = function (searchKey) {
    if (searchKey == '')
        findAll();
    else
        findByName(searchKey);
};

//searching by recipe name
var findByName = function (searchKey) {
    console.log('findByName: ' + searchKey);
    $.ajax({
        type: 'GET',
        url: rootURL + '/search/name/' + searchKey,
        dataType: "json",
        success: function (data) {
            currentRecipe = data;
            console.log(currentRecipe);
            renderTable(currentRecipe)
        }
    });
};

//add new recipe + update recipe
var addRecipe = function () {
    console.log('Adding or updating recipe');

    //get from hidden input to check if exist
    var recipeId = $('#recipeId').val();

    //POST if no id, put if got
    var ajaxSettings = {
        type: recipeId ? 'PUT' : 'POST', 
        contentType: 'application/json',
        url: recipeId ? rootURL + '/' + recipeId : rootURL, 
        dataType: "json",
        data: formToJSON(),
        success: function (data, textStatus, jqXHR) {
            alert(recipeId ? 'Recipe updated!' : 'Recipe added!');
            $('#formModal').modal('hide');
            $('#recipeForm')[0].reset();  
            findAll();  
        },
        error: function (jqXHR, textStatus, errorThrown) {
            alert('Error: ' + textStatus);
        }
    };

    $.ajax(ajaxSettings);
};

//to convert data to json format 
var formToJSON = function () {
    var recipeData = {
        name: $('#recipeName').val(),
        url: $('#recipeUrl').val(),
        author: $('#author').val(),
        time: $('#time').val(),
        servings: $('#servings').val(),
        ingredients: $('#ingredients').val(),
        instructions: $('#instructions').val(),
        picture: $('#picture').val(),
        category: $('#category').val()
    };

    console.log(recipeData);  
    return JSON.stringify(recipeData);
};

//populating the form modal
var renderDetails = function (recipe) {
    $('#recipeName').val(recipe.name);
    $('#recipeUrl').val(recipe.url);
    $('#author').val(recipe.author);
    $('#time').val(recipe.time);
    $('#servings').val(recipe.servings);
    $('#ingredients').val(recipe.ingredients);
    $('#instructions').val(recipe.instructions);
    $('#picture').val(recipe.picture);
    $('#category').val(recipe.category);
    $('#recipeId').val(recipe.id);
    $('#formModal').modal('show');
};


//deleting a recipe
var deleteRecipe = function (recipeId) {
    // Prompt before deleting
    var confirmation = confirm("Are you sure you want to delete this recipe?");

    if (confirmation) {
        $.ajax({
            type: 'DELETE',
            contentType: 'application/json',
            url: rootURL + '/' + recipeId,
            success: function (data, textStatus, jqXHR) {
                alert('Recipe deleted successfully');
                findAll()
            },
            error: function (jqXHR, textStatus, errorThrown) {
                alert('deleteRecipe error: ' + textStatus);
            }
        });
    }
};