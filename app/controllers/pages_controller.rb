class PagesController < ApplicationController
  before_action :set_page

  def show
    return redirect_to downloads_url if @page.style == 'resources'
    return redirect_to @page, status: :moved_permanently if request.path != page_path(@page)
    render layout: @page.layout
  end

  private

    def set_page
      @page = Page.displayed.friendly.find(params[:id])
      @side_menus = @page.side_menus
      @presented_page = PagePresenter.new(object: @page, view_template: view_context)
    end
end
