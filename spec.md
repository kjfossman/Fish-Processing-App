# Specifications for the Rails Assessment

Specs:
- [x] Using Ruby on Rails for the project
- [x] Include at least one has_many relationship (x has_many y; e.g. User has_many Recipes) 
    Boats has_many fish tickets
- [x] Include at least one belongs_to relationship (x belongs_to y; e.g. Post belongs_to User)
    Fish tickets belong_to boat
- [x] Include at least two has_many through relationships (x has_many y through z; e.g. Recipe has_many Items through Ingredients)
    Boats has_many tenders through: :fish tickets
- [x] Include at least one many-to-many relationship (x has_many y through z, y has_many x through z; e.g. Recipe has_many Items through Ingredients, Item has_many Recipes through Ingredients)
    Boats has_many tenders through: :fish tickets, and tenders has many boats through: :fish tickets
- [x] The "through" part of the has_many through includes at least one user submittable attribute, 
that is to say, some attribute other than its foreign keys that can be submitted by the app's user (attribute_name e.g. ingredients.quantity)
    The fish tickets have plenty of attributes 
- [x] Include reasonable validations for simple model objects (list of model objects with validations e.g. User, Recipe, Ingredient, Item)
    fish tickets have to have a unique number, they must have pounds for each species of salmon
- [x] Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most_recipes URL: /users/most_recipes)
    That is included in the fish tickets model
- [x] Include signup
    Users can signup/create account
- [x] Include login
    Users can login
- [x] Include logout
    Users can logout
- [x] Include third party signup/login (how e.g. Devise/OmniAuth)
    Users can login with google
- [x] Include nested resource show or index (URL e.g. users/2/recipes)
    There are nested resources with boats/:id/fish_tickets for index and show
- [x] Include nested resource "new" form (URL e.g. recipes/1/ingredients/new)
    There are nested resources with boats/:id/fish_tickets for new
- [x] Include form display of validation errors (form URL e.g. /recipes/new)
    Error handling showing what is wrong with the form in the field_with_errors div

Confirm:
- [x] The application is pretty DRY
- [x] Limited logic in controllers
- [x] Views use helper methods if appropriate
- [x] Views use partials if appropriate