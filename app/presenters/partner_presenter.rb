class PartnerPresenter < BasePresenter
  presents :partner
  delegate :name, to: :partner

  def partner_link
    h.link_to small_image(alt: name), h.partners_path, title: name
  end

  def content
    h.raw partner.content
  end

  def show
    if partner.website.present?
      h.link_to show_image_with_title, partner.website, title: name, target: '_blank'
    else
      show_image_with_title
    end
  end

  private

    def show_image_with_title
      show_image(alt: name)
    end
end
