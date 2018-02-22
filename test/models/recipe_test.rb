require 'test_helper'

class RecipeTest < ActiveSupport::TestCase
  def setup
    @recipe = Recipe.new(name:"Vegetable",description:"great vegetable recipe")
  end

  test "recipe should be valid" do
     assert @recipe.valid?
  end

  test "name should be present" do
    @recipe.name = " "
    assert_not @recipe.valid?
  end

  test "description should be present" do
    @recipe.description = "dasd"
    assert_not @recipe.valid?
  end

  test "descripcion shouldnt be less than 5 characters" do
    @recipe.description = "aaa"
    assert_not @recipe.valid?
  end
  test "descripcion shouldnt be less than 50 characters" do
    @recipe.description = "a" * 51
    assert_not @recipe.valid?
  end
end
