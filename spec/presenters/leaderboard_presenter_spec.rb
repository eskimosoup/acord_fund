require "rails_helper"

RSpec.describe LeaderboardPresenter, type: :presenter do
  let(:leaderboard) { build(:leaderboard) }
  subject(:leaderboard_presenter) { LeaderboardPresenter.new(object: leaderboard, view_template: view)}

  describe "delegations", :delegation do
    it { should delegate_method(:title).to(:leaderboard) }
  end

  describe "links" do
    describe "no link" do
      it "show_image should not return link" do
        expect(leaderboard_presenter.leaderboard_link(leaderboard_presenter.show_image(alt: leaderboard.title))).to eq(image_tag(leaderboard.image.show, alt: leaderboard.title))
      end
    end

    describe "has link" do
      let(:leaderboard) { build(:leaderboard_with_link) }
      subject(:leaderboard_presenter) { LeaderboardPresenter.new(object: leaderboard, view_template: view)}

      it "link should return link" do
        expect(leaderboard_presenter.leaderboard_link(leaderboard_presenter.show_image(alt: leaderboard.title))).to eq(link_to image_tag(leaderboard.image.show, alt: leaderboard.title), leaderboard.link, title: leaderboard.title, target: '_blank')
      end
    end
  end

  describe "images" do
    describe "has image" do
      it "show_image should not return nil" do
        expect(leaderboard_presenter.show_image(alt: leaderboard.title)).to eq(image_tag(leaderboard.image.show, alt: leaderboard.title))
      end
    end
  end
end
