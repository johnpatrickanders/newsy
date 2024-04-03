require "test_helper"

class FeedTest < ActionDispatch::IntegrationTest
  def setup
    @user  = users(:michael)
    log_in_as(@user)
  end

  test "should show first page of feed results" do
    get root_path
    @user.feed.paginate(page: 1).each do |micropost|
      assert_match CGI.escapeHTML(micropost.content), response.body
    end
  end
end
