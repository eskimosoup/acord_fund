class AdditionalContentPresenter < BasePresenter
  presents :additional_content
  delegate :title, :video_url, to: :additional_content

  def content
    h.raw additional_content.content
  end

  def button
    return nil unless additional_content.button_text.present? && additional_content.button_text.present?
    h.link_to additional_content.button_text, additional_content.button_link, title: additional_content.button_text
  end
end
