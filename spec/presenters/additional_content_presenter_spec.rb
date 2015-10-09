require "rails_helper"

RSpec.describe AdditionalContentPresenter, type: :presenter do
  let(:additional_content) { build(:additional_content) }
  subject(:additional_content_presenter) { AdditionalContentPresenter.new(object: additional_content, view_template: view)}

  describe "delegations", :delegation do
    it { should delegate_method(:area).to(:additional_content) }
    it { should delegate_method(:video_url).to(:additional_content) }
  end

  describe "standard additional_content" do
    it "returns the title" do
      expect(additional_content_presenter.title).to eq(additional_content.title)
    end
    it "returns the content - html escaped" do
      expect(additional_content_presenter.content).to eq(raw additional_content.content)
    end

    it "returns the YouTube embed link" do
      expect(additional_content_presenter.youtube_link).to eq("https://www.youtube.com/embed/#{additional_content.video_url.split("=").last}")
    end
  end

  describe "images" do
    describe "no image" do
      it "home_page_section_2 should return nil" do
        expect(additional_content_presenter.home_page_section_2_image).to eq(nil)
      end
      it "home_page_section_2 should return nil" do
        expect(additional_content_presenter.home_page_section_3_image).to eq(nil)
      end
    end

    describe "has image" do
      let(:additional_content) { build(:additional_content_with_image) }
      subject(:additional_content_presenter) { AdditionalContentPresenter.new(object: additional_content, view_template: view)}

      it "home_page_section_2 image should not return nil" do
        expect(additional_content_presenter.home_page_section_2_image).to eq(image_tag(additional_content.image.home_page_section_2))
      end

      it "home_page_section_3 image should not return nil" do
        expect(additional_content_presenter.home_page_section_3_image).to eq(image_tag(additional_content.image.home_page_section_3))
      end
    end
  end

  describe "button" do
    let(:additional_content) { build(:additional_content_with_button) }
    subject(:additional_content_presenter) { AdditionalContentPresenter.new(object: additional_content, view_template: view)}

    it "should have button" do
      expect(additional_content_presenter.button).to eq(link_to additional_content.button_text, additional_content.button_link, title: additional_content.button_text, class: 'content-button')
    end

    it "should have button with additional class" do
      expect(additional_content_presenter.button('colorbox-youtube')).to eq(link_to additional_content.button_text, additional_content.button_link, title: additional_content.button_text, class: 'content-button colorbox-youtube')
    end
  end
end
