require 'rails_helper'

RSpec.describe TeamMember, type: :model do
  describe "validations", :validation do
    subject(:team_member) { build(:team_member) }
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:role) }
  end

  describe "scopes", :scope do
    let(:team_member) { create(:team_member) }
    let(:hidden_team_member) { create(:team_member, display: false) }

    it 'only returns displayed' do
      expect(TeamMember.displayed).not_to include hidden_team_member
    end
  end
end
