class ContactsController < ApplicationController

  before_action :load_contact_content

  def new
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.valid?
      ContactMailer.new_contact(@contact).deliver_now
      redirect_to new_contact_path, notice: "Thank you for contacting us"
    else
      render :new
    end
  end

  private

    def contact_params
      params.require(:contact).permit(:forename, :surname, :email, :message)
    end

    def load_contact_content
      @presented_contact_sections = BaseCollectionPresenter.new(collection: AdditionalContent.displayed.where("area LIKE ?", "contact_us_%").where.not(area: 'contact_us_other_contact_details').order(area: :desc), view_template: view_context, presenter: AdditionalContentPresenter)
      @presented_other_contact_details = AdditionalContentPresenter.new(object: AdditionalContent.displayed.find_by(area: 'contact_us_other_contact_details'), view_template: view_context)
    end
end
