require 'test_helper'

class ChefTest < ActiveSupport::TestCase

  def setup
    @chef = Chef.new(name:"yosetdn",email:"yosetdn@gmail.com")
  end

  test "chef should be valid" do
    assert @chef.valid?
  end

  test "name should be present" do
    @chef.name = " "
    assert_not @chef.valid?
  end

  test "email should be present" do
    @chef.email = " "
    assert_not @chef.valid?
  end

  test "name should be less than 40 characters" do
    @chef.name = "a"*41
    assert_not @chef.valid?
  end

  test "email should be valid" do
    assert @chef.valid?
  end

  test "email should be less than 255 characters" do
    @chef.email="a"*256
    assert_not @chef.valid?
  end

end
