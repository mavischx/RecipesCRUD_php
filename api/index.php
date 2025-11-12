
<?php
// header("Access-Control-Allow-Origin: *");
// header("Content-Type: application/json");  // Ensure it's sending JSON
// header("Access-Control-Allow-Methods: GET, POST, OPTIONS"); // Allowed methods
header("Access-Control-Allow-Origin: *"); // Allow all origins (adjust as necessary)
header("Access-Control-Allow-Methods: GET, POST, PUT, DELETE, OPTIONS"); // Allow necessary HTTP methods
header("Access-Control-Allow-Headers: Content-Type, Authorization"); // Allow necessary headers

// Handle OPTIONS request for preflight
if ($_SERVER['REQUEST_METHOD'] == 'OPTIONS') {
    exit(0);  // Ends the request, avoiding unnecessary processing for OPTIONS
}
require 'Slim/Slim.php';
require 'recipe_db.php';
require 'database.php';
use Slim\Slim;
\Slim\Slim::registerAutoloader();

$app = new Slim();
$app->get('/recipes', 'getRecipes');
$app->get('/users', 'getUsers');
$app->get('/recipes/:id',  'getRecipe');
$app->get('/recipes/search/name/:query', 'findByName');
$app->get('/recipes/search/category/:query', 'findByCategory');
$app->post('/recipes', 'addRecipe');
$app->delete('/recipes/:id','deleteRecipe');
$app->put('/recipes/:id', 'updateRecipe');

$app->run();
?>