module Optimadmin
  class PartnersController < Optimadmin::ApplicationController
    before_action :set_partner, only: [:show, :edit, :update, :destroy]

    edit_images_for Partner, [[:image, { show: ['fit', 200, 200], small: ['fit', 200, 200] }]]

    def index
      @partners = Optimadmin::BaseCollectionPresenter.new(collection: Partner.where('name ILIKE ?', "%#{params[:search]}%").order(:position).page(params[:page]).per(params[:per_page] || 15), view_template: view_context, presenter: Optimadmin::PartnerPresenter)
    end

    def show
    end

    def new
      @partner = Partner.new
    end

    def edit
    end

    def create
      @partner = Partner.new(partner_params)
      if @partner.save
        redirect_to partners_url, notice: 'Partner was successfully created.'
      else
        render :new
      end
    end

    def update
      if @partner.update(partner_params)
        redirect_to partners_url, notice: 'Partner was successfully updated.'
      else
        render :edit
      end
    end

    def destroy
      @partner.destroy
      redirect_to partners_url, notice: 'Partner was successfully destroyed.'
    end

  private


    def set_partner
      @partner = Partner.find(params[:id])
    end

    def partner_params
      params.require(:partner).permit(:position, :name, :image, :image_cache, :remove_image, :remote_image_url, :content, :website, :display)
    end
  end
end
