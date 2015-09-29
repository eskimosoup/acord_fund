module Optimadmin
  class ArticlePresenter < Optimadmin::BasePresenter
    presents :article
    delegate :id, :title, to: :article

    def toggle_title
      inline_detail_toggle_link(title)
    end

    def optimadmin_summary
      h.simple_format article.summary
    end
  end
end
