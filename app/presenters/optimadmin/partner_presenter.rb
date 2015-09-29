module Optimadmin
  class PartnerPresenter < Optimadmin::BasePresenter
    presents :partner
    delegate :id, :name, to: :partner

    def toggle_title
      inline_detail_toggle_link(name)
    end

    def optimadmin_summary
      h.raw partner.content
    end
  end
end
