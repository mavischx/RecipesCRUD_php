-- USE  WebDev3_2024;


-- -- Dropping and recreating the table with updated structure
-- DROP TABLE IF EXISTS `recipes`;
-- CREATE TABLE `recipes` (
--   `id` int(11) NOT NULL AUTO_INCREMENT,
--   `name` varchar(45) DEFAULT NULL,
--   `url` varchar(256) DEFAULT NULL,
--   `author` varchar(45) DEFAULT NULL,
--   `time` varchar(45) DEFAULT NULL,
--   `servings` varchar(45) DEFAULT NULL,
--   `ingredients` text DEFAULT NULL,
--   `instructions` text DEFAULT NULL,
--   `picture` varchar(256) DEFAULT NULL,
--   `category` varchar(45) DEFAULT NULL,   
--   PRIMARY KEY (`id`)
-- ) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=latin1;

-- -- Inserting updated recipes with categories and measurements

-- INSERT INTO recipes (name, url, author, time, servings, ingredients, instructions, picture, category)
-- VALUES
--   (
--     'Spaghetti Aglio e Olio', 
--     'https://example.com/spaghetti-aglio-e-olio', 
--     'Chef Mario', 
--     '20 minutes', 
--     '2 servings', 
--     '200g Spaghetti, 4 cloves Garlic (sliced), 1/4 cup Olive Oil, 1/2 tsp Red Pepper Flakes, 1/4 cup Parmesan Cheese (grated), 2 tbsp Parsley (chopped), Salt to taste', 
--     '1. Cook spaghetti until al dente. 2. Sauté garlic and red pepper flakes in olive oil. 3. Toss spaghetti with garlic oil and top with parmesan and parsley.',
--     'https://example.com/images/spaghetti.jpg',
--     'Dinner'
--   ),
--   (
--     'Classic Grilled Cheese Sandwich', 
--     'https://example.com/grilled-cheese', 
--     'Chef Sarah', 
--     '10 minutes', 
--     '1 serving', 
--     '2 slices of Bread, 2 slices of Cheese, 1 tbsp Butter', 
--     '1. Butter both sides of the bread. 2. Place cheese between bread slices. 3. Grill on a skillet until golden brown and cheese is melted.',
--     'https://example.com/images/grilled-cheese.jpg',
--     'Lunch'
--   ),
--   (
--     'Easy Pancakes', 
--     'https://example.com/easy-pancakes', 
--     'Chef John', 
--     '15 minutes', 
--     '4 servings', 
--     '1 cup Flour, 1 cup Milk, 2 Eggs, 2 tbsp Sugar, 1 tsp Baking Powder, Pinch of Salt, 2 tbsp Butter (melted)', 
--     '1. Mix dry ingredients in a bowl. 2. Add milk and eggs, whisk until smooth. 3. Cook pancakes on a greased skillet until golden brown.',
--     'https://example.com/images/pancakes.jpg',
--     'Breakfast'
--   ),
--   (
--     'Guacamole', 
--     'https://example.com/guacamole', 
--     'Chef Ana', 
--     '5 minutes', 
--     '4 servings', 
--     '3 Avocados, 2 tbsp Lime Juice, 1 tsp Salt, 2 tbsp Cilantro (chopped), 1/2 Onion (diced), 1 Tomato (diced), 1 Jalapeno (minced)', 
--     '1. Mash avocados in a bowl. 2. Stir in lime juice, salt, cilantro, onion, tomato, and jalapeno. 3. Serve with tortilla chips.',
--     'https://example.com/images/guacamole.jpg',
--     'Appetizer'
--   ),
--   (
--     'Banana Smoothie', 
--     'https://example.com/banana-smoothie', 
--     'Chef Emma', 
--     '5 minutes', 
--     '2 servings', 
--     '2 Bananas, 1 cup Milk, 1 tbsp Honey, 1 cup Ice Cubes, 1/2 tsp Vanilla Extract', 
--     '1. Blend bananas, milk, honey, ice, and vanilla extract until smooth. 2. Pour into glasses and serve immediately.',
--     'https://example.com/images/banana-smoothie.jpg',
--     'Breakfast'
--   );

-- -- Selecting all the updated records
-- SELECT * FROM recipes;

USE  WebDev3_2024;


-- Dropping and recreating the table with updated structure
DROP TABLE IF EXISTS `recipes`;
CREATE TABLE `recipes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `url` varchar(256) DEFAULT NULL,
  `author` varchar(45) DEFAULT NULL,
  `time` varchar(45) DEFAULT NULL,
  `servings` varchar(45) DEFAULT NULL,
  `ingredients` text DEFAULT NULL,
  `instructions` text DEFAULT NULL,
  `picture` varchar(256) DEFAULT NULL,
  `category` varchar(45) DEFAULT NULL,   
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=latin1;

-- Inserting updated recipes with categories and measurements

INSERT INTO recipes (name, url, author, time, servings, ingredients, instructions, picture, category)
VALUES
--   (
--     'Spaghetti Aglio e Olio', 
--     'https://example.com/spaghetti-aglio-e-olio', 
--     'Chef Mario', 
--     '20 minutes', 
--     '2 servings', 
--     '200g Spaghetti, 4 cloves Garlic (sliced), 1/4 cup Olive Oil, 1/2 tsp Red Pepper Flakes, 1/4 cup Parmesan Cheese (grated), 2 tbsp Parsley (chopped), Salt to taste', 
--     'Cook spaghetti until al dente. Sauté garlic and red pepper flakes in olive oil.Toss spaghetti with garlic oil and top with parmesan and parsley.',
--     'https://example.com/images/spaghetti.jpg',
--     'Dinner'
--   ),
--   (
--     'Classic Grilled Cheese Sandwich', 
--     'https://example.com/grilled-cheese', 
--     'Chef Sarah', 
--     '10 minutes', 
--     '1 serving', 
--     '2 slices of Bread, 2 slices of Cheese, 1 tbsp Butter', 
--     'Butter both sides of the bread. Place cheese between bread slices. Grill on a skillet until golden brown and cheese is melted.',
--     'https://example.com/images/grilled-cheese.jpg',
--     'Lunch'
--   ),
--   (
--     'Easy Pancakes', 
--     'https://example.com/easy-pancakes', 
--     'Chef John', 
--     '15 minutes', 
--     '4 servings', 
--     '1 cup Flour, 1 cup Milk, 2 Eggs, 2 tbsp Sugar, 1 tsp Baking Powder, Pinch of Salt, 2 tbsp Butter (melted)', 
--     'Mix dry ingredients in a bowl. Add milk and eggs, whisk until smooth.Cook pancakes on a greased skillet until golden brown.',
--     'https://example.com/images/pancakes.jpg',
--     'Breakfast'
--   ),
--   (
--     'Guacamole', 
--     'https://example.com/guacamole', 
--     'Chef Ana', 
--     '5 minutes', 
--     '4 servings', 
--     '3 Avocados, 2 tbsp Lime Juice, 1 tsp Salt, 2 tbsp Cilantro (chopped), 1/2 Onion (diced), 1 Tomato (diced), 1 Jalapeno (minced)', 
--     'Mash avocados in a bowl.Stir in lime juice, salt, cilantro, onion, tomato, and jalapeno.Serve with tortilla chips.',
--     'https://example.com/images/guacamole.jpg',
--     'Appetizer'
--   ),
--   (
--     'Banana Smoothie', 
--     'https://example.com/banana-smoothie', 
--     'Chef Emma', 
--     '5 minutes', 
--     '2 servings', 
--     '2 Bananas, 1 cup Milk, 1 tbsp Honey, 1 cup Ice Cubes, 1/2 tsp Vanilla Extract', 
--     'Blend bananas, milk, honey, ice, and vanilla extract until smooth.Pour into glasses and serve immediately.',
--     'https://example.com/images/banana-smoothie.jpg',
--     'Breakfast'
--   );
  (
    'Simple Deviled Eggs', 
    'https://www.allrecipes.com/recipe/222589/simple-deviled-eggs/', 
    'Chef Linda', 
    '30 minutes', 
    '6 servings', 
    '6 Eggs, 1/4 cup Mayonnaise, 1 tsp Dijon Mustard, 1 tsp White Vinegar, 1/8 tsp Salt, 1/8 tsp Pepper, Paprika for garnish', 
    'Hard boil eggs and peel. Slice in half and remove yolks. Mix yolks with mayonnaise, mustard, vinegar, salt, and pepper. Refill egg whites with the mixture. Garnish with paprika.',
    'https://www.allrecipes.com/thmb/2XKE0aKGVcShhaezVkfPtSHVhyA=/0x512/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/222589-simple-deviled-eggs-ddmfs-1382-4x3-dea80f9108f044af8a8e29c1664bfa13.jpg',  -- Replace with actual image URL
    'Appetizer'
  ),
 (
  'Shortbread Cookies II',
  'https://www.allrecipes.com/recipe/10269/shortbread-cookies-ii/',
  'AllRecipes',
  '45 minutes',
  '24 cookies',
  '1 cup butter (softened), 1/2 cup white sugar, 2 1/2 cups all-purpose flour',
  '1. Preheat oven to 350°F (175°C).\n2. Cream butter and sugar until light and fluffy.\n3. Gradually add flour and mix until well combined.\n4. Press dough into a baking dish or form into cookies.\n5. Bake for 20-25 minutes until edges are lightly golden.',
  'https://www.allrecipes.com/thmb/A0AShxHij8CYHeMkF1ds0CLGV24=/0x512/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/10269-shortbread-cookies-ii-ddmfs-beauty-3x4-a49d3dc16dd747bcb4b28a6a3fa14a58.jpg',
  'Dessert'
),
  (
    'Simple Beef Stroganoff', 
    'https://www.allrecipes.com/recipe/16311/simple-beef-stroganoff/', 
    'Chef Peter', 
    '40 minutes', 
    '4 servings', 
    '1 lb Beef Sirloin (sliced), 1/2 Onion (chopped), 1 cup Mushrooms (sliced), 1/2 cup Sour Cream, 1/4 cup Beef Broth, 2 tbsp Flour, 2 tbsp Butter, Salt and Pepper to taste', 
    'Cook beef in butter until browned. Add onions and mushrooms, cook until soft. Sprinkle with flour, stir in broth. Simmer and add sour cream. Serve over noodles or rice.',
    'https://www.allrecipes.com/thmb/-fUqqWvu-qBSZeYIr60Ah_Xe3JA=/0x512/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/16311-simple-beef-stroganoff-DDMFS-4x3-1e966286eef54c0f96c882e569926eb3.jpg',  -- Replace with actual image URL
    'Dinner'
  ),
  (
    'Simple Garlic Shrimp', 
    'https://www.allrecipes.com/recipe/220597/simple-garlic-shrimp/', 
    'Chef Maria', 
    '20 minutes', 
    '4 servings', 
    '1 lb Shrimp (peeled), 4 cloves Garlic (minced), 2 tbsp Butter, 1/4 cup White Wine, 1 tbsp Lemon Juice, 2 tbsp Parsley (chopped), Salt and Pepper to taste', 
    'Sauté garlic in butter. Add shrimp and cook until pink. Pour in white wine and lemon juice. Simmer for 5 minutes. Sprinkle with parsley before serving.',
    'https://www.allrecipes.com/thmb/cJJ2VrucGWokvfxV3-G3d2j9NnI=/0x512/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/220597-Simple-garlic-shrimp-beauty3x4_38539-63f687e1ec6a41e88dfb5a9c9021e194.jpg',  -- Replace with actual image URL
    'Appetizer'
  ),
  (
    'Lemon Poppy Seed Pancakes', 
    'https://www.allrecipes.com/lemon-poppy-seed-pancakes-recipe-8706892', 
    'Chef Chloe', 
    '25 minutes', 
    '4 servings', 
    '1 cup Flour, 1 cup Buttermilk, 2 Eggs, 2 tbsp Sugar, 2 tbsp Poppy Seeds, Zest of 1 Lemon, 1 tsp Baking Powder, 1/2 tsp Baking Soda, 1/4 tsp Salt, 2 tbsp Melted Butter', 
    'Mix dry ingredients. In another bowl, whisk buttermilk, eggs, and lemon zest. Combine with dry ingredients. Cook pancakes on a greased skillet until golden.',
    'https://www.allrecipes.com/thmb/7ziW1nAlNg_Eol2RrWXvh395Oxc=/0x512/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/8706892_Lemon-Poppy-Seed-Pancakes-4x3-cropped-c64118c1a1444116aef8f6e850f2c541.jpg',  -- Replace with actual image URL
    'Breakfast'
  );

-- Selecting all the updated records
SELECT * FROM recipes;

