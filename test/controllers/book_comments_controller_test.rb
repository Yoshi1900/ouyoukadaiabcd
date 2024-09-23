require "test_helper"

class BookCommentsControllerTest < ActionDispatch::IntegrationTest
  test "should get creat" do
    get book_comments_creat_url
    assert_response :success
  end

  test "should get destroy" do
    get book_comments_destroy_url
    assert_response :success
  end
end
