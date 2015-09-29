module Optimadmin
  class AdditionalContentPresenter < Optimadmin::BasePresenter
    presents :additional_content
    delegate :id, :title, :area, to: :additional_content


    def toggle_title
      inline_detail_toggle_link(title)
    end

    def optimadmin_summary
      h.raw additional_content.content
    end
  end
end
