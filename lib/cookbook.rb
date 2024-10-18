require "csv"

class Cookbook
  def initialize(csv_file)
    @csv_file = csv_file
    @recipes = []
    load_csv
  end

  def all
    @recipes
  end

  def create(recipe)
    @recipes << recipe
    save_csv
  end

  def destroy(index)
    @recipes.delete_at(index)
    save_csv
  end

  private

  def load_csv
    CSV.foreach(@csv_file, headers: :first_row) do |row|
      # p row["name"]
      # p row["description"]
      @recipes << Recipe.new(row["name"], row["description"])
      # make a recipe with each row
      # put it in the recipes array
    end
  end

  def save_csv
    CSV.open(@csv_file, "wb") do |csv|
      # ["crumpets", "description..."]
      # iterate over the recipes
      csv << ["name", "description"]
      @recipes.each do |recipe|
        csv << [recipe.name, recipe.description]
      end
      # make an array with name and description
      # push it in the csv file
    end
  end
end
