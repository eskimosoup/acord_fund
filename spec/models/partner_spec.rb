require 'rails_helper'

RSpec.describe Partner, type: :model do
  describe "validations", :validation do
    let(:partner) { create(:partner) }
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:image) }
  end

  describe "scopes", :scope do
    let(:partner) { create(:partner) }
    let(:hidden_partner) { create(:partner, display: false) }

    it 'only returns displayed' do
      expect(Partner.displayed).not_to include hidden_partner
    end
  end
end
