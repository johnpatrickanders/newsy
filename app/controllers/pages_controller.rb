class PagesController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  before_action :correct_user,   only: :destroy

  def new
    @groups = correct_user.groups.all
  end

  def create
    @page = current_user.pages.build(page_params)
    if @page.save
      flash[:success] = "Page created!"
      redirect_to pages_url
    else
      @feed_items = current_user.pages.paginate(page: 1)
      render 'static_pages/pages', status: :unprocessable_entity
    end
  end

  def destroy
    @page.destroy
    flash[:success] = "Page deleted"
    redirect_back_or_to(root_url, status: :see_other) # equivalent to commented out code above
  end

  def show
    @page = Page.find(params[:id])
    @articles = @page.articles.paginate(page: params[:page])
  end

  private
    def page_params
      params.require(:page).permit(:duration, :category, :group_id, :id)
    end

    def correct_user
      @page = current_user.pages.find_by(id: params[:id])
      redirect_to root_url, status: :see_other if @page.nil?
    end
end
