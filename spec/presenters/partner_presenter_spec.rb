require "rails_helper"

RSpec.describe PartnerPresenter, type: :presenter do
  let(:partner) { build(:partner) }
  subject(:partner_presenter) { PartnerPresenter.new(object: partner, view_template: view)}

  describe "delegations", :delegation do
    it { should delegate_method(:name).to(:partner) }
  end

  describe "standard partner" do
    it "returns partner thumbnail with link to partners page" do
      expect(partner_presenter.partner_link).to eq(link_to (partner_presenter.small_image(alt: partner.name)), partners_path, title: partner.name)
    end

    it "returns partner summary - html escaped" do
      expect(partner_presenter.content).to eq(raw partner.content)
    end
  end

  describe "websites" do
    describe "no website" do
      it "partner website should just image" do
        expect(partner_presenter.show).to eq(partner_presenter.show_image(alt: partner.name))
      end

      it "no partner link" do
        expect(partner_presenter.website).to eq(nil)
      end
    end

    describe "has website" do
      let(:partner) { build(:partner_with_website) }
      subject(:partner_presenter) { PartnerPresenter.new(object: partner, view_template: view)}

      it "partner website should image with website link" do
        expect(partner_presenter.show).to eq(link_to (partner_presenter.show_image(alt: partner.name)), partner.website, title: partner.name, target: '_blank')
      end

      it "returns partner link" do
        expect(partner_presenter.website).to eq(link_to partner.website, partner.website, target: '_blank')
      end
    end
  end
end
