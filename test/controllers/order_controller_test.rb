require 'test_helper'

class OrderControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  include Devise::Test::ControllerHelpers

  def setup
      @request.env["devise.mapping"]  = Devise.mappings[:admin]
     sign_in FactoryBot.create(:admin)
  end


  test "test that rspec works" do

      assert_not true
  end
end
