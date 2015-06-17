require 'test_helper'

class RecipeTest < ActiveSupport::TestCase
  
  def setup
    @recipe = Recipe.new(name:"Chicken curry", summary:"This is a spicy dish", description:"heat oil, add onions, add paste, add chicken, cook for 15 min")
  end
  
  test "recipe should be valid" do
    assert @recipe.valid?
  end
  
  test "name should be present" do
    @recipe.name = "   "
    assert_not @recipe.valid?
  end
  
  test "summary should be present" do
    @recipe.summary = " "
    assert_not @recipe.valid?
  end
  
  test "summary should not be too long" do 
    @recipe.summary = "a" * 101 
    assert_not @recipe.valid?
  end
  
  test "description should not be too long" do
    @recipe.description = "a" * 1001
    assert_not @recipe.valid?
  end
  
  
end