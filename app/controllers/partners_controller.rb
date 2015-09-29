class PartnersController < ApplicationController
  def index
    @presented_partners = BaseCollectionPresenter.new(collection: Partner.positioned, view_template: view_context, presenter: PartnerPresenter)
  end
end
