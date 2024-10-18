require_relative "view"
require_relative "recipe"

class Controller
  def initialize(cookbook)
    @cookbook = cookbook
    @view = View.new
  end

  def list
    display_recipes
  end

  def add
    # Ask the view to ask for a name and store it
    name = @view.ask_for("name")
    # Ask the view to ask for a description and store it
    description = @view.ask_for("description")
    # create a recipe with name and description
    recipe = Recipe.new(name, description)
    # ask the cookbook to save the recipe in the array
    @cookbook.create(recipe)
  end

  def remove
    # display the recipes
    display_recipes
    # ask the view to ask for a number (index) and store it
    index = @view.ask_for_index
    # ask the cookbook to delete the recipe at that index
    @cookbook.destroy(index)
  end

  private

  def display_recipes
     # get the recipes from the cookbook
     recipes = @cookbook.all
     # ask the view to display the recipes
     @view.display_list(recipes)
  end
end
