class PartnersController < ApplicationController
  def index
    @presented_additional_content = AdditionalContentPresenter.new(object: AdditionalContent.displayed.find_by(area: 'partners'), view_template: view_context)
    @presented_page_partners = BaseCollectionPresenter.new(collection: Partner.partners_page.positioned, view_template: view_context, presenter: PartnerPresenter)
  end
end
