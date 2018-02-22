require 'test_helper'

class RecipesTest < ActionDispatch::IntegrationTest

  def setup
    @user=Chef.create!(name:"yosetdn",email:"yosetdn@gmail.com")
    @recipe=Recipe.create(name:"vegetable saute",description:"great vegetable soute,add vegetable and oil",chef:@user)
    @recipe2=@user.recipes.build(name:"chicken little",description:"great chicken dish xd")
    @recipe2.save
  end

  test "should get recipes index" do
    get recipes_path
    assert_response :success
  end

  test "should get recipes listing" do
    get recipes_path
    assert_template 'recipes/index'
    assert_match @recipe.name, response.body
    assert_match @recipe2.name, response.body
  end

end
