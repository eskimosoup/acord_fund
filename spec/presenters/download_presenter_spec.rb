require "rails_helper"

RSpec.describe DownloadPresenter, type: :presenter do
  let(:download) { build(:download) }
  subject(:download_presenter) { DownloadPresenter.new(object: download, view_template: view)}

  describe "delegations", :delegation do
    it { should delegate_method(:title).to(:download) }
  end

  describe "standard download" do
    it "returns download link" do
      expect(download_presenter.download_link).to eq(link_to download.title, download.file.url, title: download.title)
    end
  end
end
