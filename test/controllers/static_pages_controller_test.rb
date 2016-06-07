require 'test_helper'

class StaticPagesControllerTest < ActionController::TestCase

  def setup
    @base_title = "Torah Illustrations"
  end

  test "should get home" do
    get :home
    assert_response :success
    assert_select "title", "Torah Illustrations"
  end

  test "should get help" do
    get :help
    assert_response :success
    assert_select "title", "Help | Torah Illustrations"
  end

  test "should get about" do
    get :about
    assert_response :success
    assert_select "title", "About | Torah Illustrations"
  end

  test "should get contact" do
    get :contact
    assert_response :success
    assert_select "title", "Contact | Torah Illustrations"
  end


end