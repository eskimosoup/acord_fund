class AdditionalContentPresenter < BasePresenter
  presents :additional_content
  delegate :area, :video_url, to: :additional_content

  def title
    additional_content.title if additional_content.present? && additional_content.title.present?    
  end

  def content
    h.raw additional_content.content if additional_content.present? && additional_content.content.present?
  end

  def button(classes = '')
    return nil unless additional_content.button_text.present? && additional_content.button_text.present?
    h.link_to additional_content.button_text, additional_content.button_link, title: additional_content.button_text, class: "content-button#{" #{classes}" if classes.present?}"
  end

  def youtube_link
    "https://www.youtube.com/embed/#{video_url.split("=").last}"
  end
end
