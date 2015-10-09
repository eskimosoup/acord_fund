module Optimadmin
  class AdditionalContentPresenter < Optimadmin::BasePresenter
    presents :additional_content
    delegate :id, :title, to: :additional_content

    def area
      AdditionalContent::AREAS.select{|x| x[1] == additional_content.area}[0][0]
    end


    def toggle_title
      inline_detail_toggle_link(title)
    end

    def optimadmin_summary
      h.raw additional_content.content
    end
  end
end
