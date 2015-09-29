require "rails_helper"

RSpec.describe AdditionalContentPresenter, type: :presenter do
  let(:additional_content) { build(:additional_content) }
  subject(:additional_content_presenter) { AdditionalContentPresenter.new(object: additional_content, view_template: view)}

  describe "delegations", :delegation do
    it { should delegate_method(:title).to(:additional_content) }
  end

  describe "standard additional_content" do
    it "returns the content - html escaped" do
      expect(additional_content_presenter.content).to eq(raw additional_content.content)
    end
  end

  describe "images" do
    describe "no image" do
      it "show image should return nil" do
        expect(additional_content_presenter.show_image).to eq(nil)
      end

      it "index image should return nil" do
        expect(additional_content_presenter.index_image).to eq(nil)
      end
    end

    describe "has image" do
      let(:additional_content) { build(:additional_content_with_image) }
      subject(:additional_content_presenter) { AdditionalContentPresenter.new(object: additional_content, view_template: view)}

      it "index image should not return nil" do
        expect(additional_content_presenter.index_image).to eq(image_tag(additional_content.image.index))
      end

      it "show image should not return nil" do
        expect(additional_content_presenter.show_image).to eq(image_tag(additional_content.image.show))
      end
    end
  end

  describe "button" do
    let(:additional_content) { build(:additional_content_with_button) }
    subject(:additional_content_presenter) { AdditionalContentPresenter.new(object: additional_content, view_template: view)}

    it "should have button" do
      expect(additional_content_presenter.button).to eq(link_to additional_content.button_text, additional_content.button_link, title: additional_content.button_text)
    end
  end
end
