class ArticlesController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  before_action :correct_user,   only: :destroy

  def create
    @article = current_user.articles.build(article_params)

    # hard code source until source feature built
    @article.source_id = 1

    if @article.save
      flash[:success] = "Article posted!"
      redirect_to root_url
    else
      @feed_items = current_user.feed.paginate(page: 1)
      render 'static_pages/home', status: :unprocessable_entity
    end
  end

  def destroy
    @article.destroy
    flash[:success] = "Article deleted"
    redirect_back_or_to(root_url, status: :see_other) # equivalent to commented out code above
  end

  def photo
    "rails.svg"
  end

  private

    def article_params
      params.require(:article).permit(:content, :source_id, :url, :title)
    end

    def correct_user
      @article = current_user.articles.find_by(id: params[:id])
      redirect_to root_url, status: :see_other if @article.nil?
    end
end
