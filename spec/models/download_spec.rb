require 'rails_helper'

RSpec.describe Download, type: :model do
  describe "validations", :validation do
    before { download.update_attribute :title, "Download title" }
    let(:download) { create(:download) }
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:file) }
    it { should validate_uniqueness_of(:title).case_insensitive }
  end

  describe "scopes", :scope do
    let(:download) { create(:download) }
    let(:hidden_download) { create(:download, display: false) }

    it 'only returns displayed' do
      expect(Download.displayed).not_to include hidden_download
    end
  end
end
