class StaticPagesController < ApplicationController
  def home
    if logged_in?
      @micropost  = current_user.microposts.build
      @article = current_user.articles.build
      @feed_items = current_user.feed.paginate(page: params[:page])
    end
  end

  def help
  end

  def about
  end

  def contact
  end

  def articles
    if logged_in?
      @micropost  = current_user.microposts.build
      @article = current_user.articles.build
      @feed_items = current_user.articles.paginate(page: params[:page])
    end
  end

  def pages
    if logged_in?
      @page  = current_user.pages.build
      @feed_items = current_user.pages.paginate(page: params[:page])
    end
  end
end
