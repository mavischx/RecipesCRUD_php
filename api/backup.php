<?php

function getRecipes() {
    if (isset($_GET['sort'])) {
        $col = $_GET['sort'];
    } else {
        $col = "name";
    }
    $query = "SELECT * FROM recipes ORDER BY " . "$col";
    try {
        global $db;
        $recipes = $db->query($query);
        $recipe = $recipes->fetchAll(PDO::FETCH_ASSOC);
        header("Content-Type: application/json", true);
        echo '{"recipes": ' . json_encode($recipe) . '}';
    } catch (PDOException $e) {
        echo '{"error":{"text":' . $e->getMessage() . '}}';
    }
}

function getRecipe($id) {
    $query = "SELECT * FROM recipes WHERE id = '$id'";
    try {
        global $db;
        $recipes = $db->query($query);
        $recipe = $recipes->fetch(PDO::FETCH_ASSOC);
        header("Content-Type: application/json", true);
        echo json_encode($recipe);
    } catch (PDOException $e) {
        echo '{"error":{"text":' . $e->getMessage() . '}}';
    }
}

function findByName($name) {
    $query = "SELECT * FROM recipes WHERE UPPER(name) LIKE " . '"%' . $name . '%"' . " ORDER BY name";
    try {
        global $db;
        $recipes = $db->query($query);
        $recipe = $recipes->fetch(PDO::FETCH_ASSOC);
        header("Content-Type: application/json", true);
        echo json_encode($recipe);
    } catch (PDOException $e) {
        echo '{"error":{"text":' . $e->getMessage() . '}}';
    }
}

function findByCategory($category) {
    $query = "SELECT * FROM recipes WHERE UPPER(category) LIKE " . '"%' . $category . '%"' . " ORDER BY name";
    try {
        global $db;
        $recipes = $db->query($query);
        $recipe = $recipes->fetchAll(PDO::FETCH_ASSOC);
        header("Content-Type: application/json", true);
        echo json_encode($recipe);
    } catch (PDOException $e) {
        echo '{"error":{"text":' . $e->getMessage() . '}}';
    }
}

function addRecipe() {
    global $app;
	$request = $app->request();
	$recipe = json_decode($request->getBody());
	$name = $recipe->name;
	$url = $recipe->url;
	$author = $recipe->author;
	$time = $recipe->time;
	$servings = $recipe->servings;
	$ingredients = $recipe->ingredients;
	$instructions = $recipe->instructions;
	$picture = $recipe->picture;
	$query = "INSERT INTO recipes
                 (name, url, author, time, servings, ingredients, instructions, picture)VALUES('$name', '$url', '$author', '$time', '$servings', '$ingredients', '$instructions', '$picture')";
	try {global $db;
		$db->exec($query);
		$recipe->id = $db->lastInsertId();
		echo json_encode($recipe); 
	} catch(PDOException $e) {
		echo '{"error":{"text":'. $e->getMessage() .'}}'; 
	}
}
function deleteRecipe($id) {
	$query = "DELETE FROM recipes WHERE id='$id'";
	try {
		global $db;
		$db->exec($query);
	} catch(PDOException $e) {
		echo '{"error":{"text":'. $e->getMessage() .'}}'; 
	}
}

function updateRecipe($id) {
	global $app;
	$request = $app->request();
	$recipe = json_decode($request->getBody());
	$name = $recipe->name;
	$url = $recipe->url;
	$author = $recipe->author;
	$time = $recipe->time;
	$servings = $recipe->servings;
	$ingredients = $recipe->ingredients;
	$instructions = $recipe->instructions;
	$picture = $recipe->picture;
	$query = "UPDATE recipes SET name='$name', url='$url', author='$author', time='$time', servings='$servings', ingredients='$ingredients', instructions='$instructions', picture='$picture' WHERE id='$id'";
	try {
		global $db;
		 $db->exec($query); 
		 echo json_encode($recipe);
	} catch(PDOException $e) {
		echo '{"error":{"text":'. $e->getMessage() .'}}'; 
	}
}

?>