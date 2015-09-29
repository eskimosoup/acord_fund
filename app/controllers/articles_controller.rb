class ArticlesController < ApplicationController
  before_action :set_article, only: :show

  def index
    @presented_articles = BaseCollectionPresenter.new(collection: Article.displayed.ordered.page(params[:page]).per(12), view_template: view_context, presenter: ArticlePresenter)
  end

  def show
    return redirect_to @article, status: :moved_permanently if request.path != article_path(@article)
  end

  private

    def set_article
      @article = Article.displayed.friendly.find(params[:id])
      @presented_article = ArticlePresenter.new(object: @article, view_template: view_context)
    end
end
