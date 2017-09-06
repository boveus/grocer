#General description
- This web application will allow users to create recipes and generate a list of
required grocery items to make those recipes.  Once the list is created, the
user will be able to delete items from their grocery list to check them off as they shop.  Additionally, they will be able to (optionally) set up a pantry which
includes ingredients they currently have.  The app will compare their pantry
to their recipes and only give them a list of things they will need.

# A user can CRUD the following items:
- recipes, their pantry, and grocery list.
- Assign ingredients to categories (maybe)
# 1-1 and 1-many relationships
- a recipe has many ingredients
- a pantry has many ingredients
- a grocery list has many ingredients
- a category has many ingredients
- an ingredient belongs to a category

#ReST-ful routes
- CRUD functionality for recipes, pantry, and grocery list
- grocery list will be a partial CRUD since it will be auto generated
- Users can delete (check items off) of their grocery list

# Well structured relational database design
- sub categories of ingredients based on department
- IE produce, spices, dry good etc.  schema TBD

# Rails helpers
*Sessions, flashes and maybe cookies if you have a good use case for them.*
- Sessions for storing a particular user's grocery list, pantry, and recipes
*Authentication*
- Users must log in to view their pantry and grocery list.
*Authorization*
- Users can only view their own pantry/grocery list and recipes.
- Optionally (stretch goal) of making a recipe public to share with other users


#General description
- This web application will allow users to create recipes and generate a list of
required grocery items to make those recipes.  Once the list is created, the
user will be able to delete items from their grocery list to check them off as they shop.  Additionally, they will be able to (optionally) set up a pantry which
includes ingredients they currently have.  The app will compare their pantry
to their recipes and only give them a list of things they will need.

# A user can CRUD the following items:
- recipes, their pantry, and grocery list.
- Assign ingredients to categories (maybe)
# 1-1 and 1-many relationships
- a user has one pantry
- a user has one grocery list
- a recipe has many ingredients
- a pantry has many ingredients
- a grocery list has many ingredients
- a category has many ingredients
- an ingredient belongs to a category

#ReST-ful routes
- CRUD functionality for recipes, pantry, and grocery list
- grocery list will be a partial CRUD since it will be auto generated
- Users can delete (check items off) of their grocery list

# Well structured relational database design
- sub categories of ingredients based on department
- IE produce, spices, dry good etc.  schema TBD

# Rails helpers
*Sessions, flashes and maybe cookies if you have a good use case for them.*
- Sessions for allowing a user to visit a particular user's grocery list, pantry, and recipes
*Authentication*
- Users must log in to view their pantry and grocery list.
*Authorization*
- Users can only view their own pantry/grocery list and recipes.
- Optionally (stretch goal) of making a recipe public to share with other users
Add Comment Collapse

1) the many to many relationships would be the following:

grocery lists - ingredients
users - grocery lists
- a user has one pantry
- a user has one grocery list
- a recipe has many ingredients
- a pantry has many ingredients
- a grocery list has many ingredients
- a category has many ingredients
- an ingredient belongs to a category

assuming there is more than 1 user, there will be many lists with many ingredients.


the 1 to many would be the categories to ingredients.  each category will have many ingredients associated with it

an authenticated user will see their grocery list, pantry, and recipes.  an unauthenticated user will see a registration page and a description of the app and possibly public recipes if i decide to implement that later (edited)
