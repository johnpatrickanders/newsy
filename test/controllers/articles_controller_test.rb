require "test_helper"

class ArticlesControllerTest < ActionDispatch::IntegrationTest
  def setup
    @article = Article.first
  end

  test "should redirect create when not logged in" do
    assert_no_difference 'Article.count' do
      post articles_path, params: { user_id: 1, article: { title: "hello", content: "Lorem ipsum" } }
    end
    assert_redirected_to login_url
  end

  test "should redirect destroy when not logged in" do
    assert_no_difference 'Article.count' do
      delete article_path(@article)
    end
    assert_response :see_other
    assert_redirected_to login_url
  end

  test "should redirect destroy for wrong article" do
    log_in_as(users(:archer))
    article = articles(:second)
    assert_no_difference 'Article.count' do
      delete article_path(article)
    end
    assert_response :see_other
    assert_redirected_to root_url
  end
end
