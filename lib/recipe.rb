#  TODO: Define your Recipe class here
class Recipe
  attr_reader :name, :description

  def initialize(name, description)
    @name = name # string
    @description = description # string
  end
end
