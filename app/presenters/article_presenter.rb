class ArticlePresenter < BasePresenter
  presents :article
  delegate :title, to: :article

  def linked_title
    h.link_to title, article, title: title
  end

  def summary
    h.simple_format article.summary
  end

  def content
    h.raw article.content
  end

  def date(format = :default)
    h.l article.date, format: format
  end
end
