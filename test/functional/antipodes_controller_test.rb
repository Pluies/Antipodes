require 'test_helper'

class AntipodesControllerTest < ActionController::TestCase
  test "the truth" do
    assert true
  end

  test "the index page works" do
    get :show
    assert_response :success
  end

  test "searching for a city" do
    get :address, {:q => 'paris, france'}
    assert_response :success
  end

  test "searching for a country" do
    get :country, {:q => 'france'}
    assert_response :success
  end
  
end
