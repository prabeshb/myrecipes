require 'test_helper'

class ChefTest < ActiveSupport::TestCase
  
  def setup
    @chef = Chef.new(chefname: "John", email: "a@b.com")
  end
  
  test "chef should be valid" do
    assert @chef.valid?
  end
  
  test "chef name should be valid" do
    @chef.chefname = ''
    assert_not @chef.valid?
  end
  
  test "email should be present" do
    @chef.email = ''
    assert_not @chef.valid?
  end

  test "email address should be unique" do
    dup_chef = @chef.dup
    dup_chef.email = @chef.email.upcase
    @chef.save
    assert_not dup_chef.valid?
  end
  
  test "email address should be valid" do
      valid_addresses = %w[user@lddd.com R_TT@hello.org]
      valid_addresses.each do |val|
          @chef.email = val
          assert @chef.valid?, "#{val.inspect} should be valid"
      end
  end
  
  test "email address invalid" do 
    invalid_address = %w[user@sss,com test@testing testing_at_test.com]
    invalid_address.each do |iv|
      @chef.email = iv
      assert_not @chef.valid?, "#{iv.inspect} is invalid"
    end
  end
  

end
