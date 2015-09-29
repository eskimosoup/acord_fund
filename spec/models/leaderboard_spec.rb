require 'rails_helper'

RSpec.describe Leaderboard, type: :model do
  describe "validations", :validation do
    let(:leaderboard) { create(:leaderboard) }
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:area) }
    it { should validate_presence_of(:image) }
  end

  describe "scopes", :scope do
    let(:leaderboard) { create(:leaderboard) }
    let(:hidden_leaderboard) { create(:leaderboard, display: false) }

    it 'only returns displayed' do
      expect(Leaderboard.displayed).not_to include hidden_leaderboard
    end
  end
end
