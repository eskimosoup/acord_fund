class ArticlePresenter < BasePresenter
  presents :article
  delegate :title, to: :article

  def linked_title(text = title)
    h.link_to text, article, title: title
  end

  def linked_index_image
    h.link_to index_image(alt: article.title), article, title: title unless index_image.blank?
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
