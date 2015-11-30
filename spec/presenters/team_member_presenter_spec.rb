require "rails_helper"

RSpec.describe TeamMemberPresenter, type: :presenter do
  let(:team_member) { build(:team_member) }
  subject(:team_member_presenter) { TeamMemberPresenter.new(object: team_member, view_template: view)}

  describe "delegations", :delegation do
    it { should delegate_method(:name).to(:team_member) }
    it { should delegate_method(:role).to(:team_member) }
  end

  describe "standard team member" do
    it "returns the biography - html formatted" do
      expect(article_presenter.biography).to eq(raw team_member.biography)
    end
  end
end
