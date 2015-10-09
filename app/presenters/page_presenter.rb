class PagePresenter < BasePresenter
  presents :page
  delegate :title, :file, :file_download_text, to: :page

  def content
    h.raw page.content
  end

  def file_download
    return nil if file.blank?
    h.link_to file.url, title: file_download_text do
      h.concat h.image_tag 'components/internal/download-icon.png', class: 'download-icon', alt: file_download_text
      h.concat file_download_text
    end
  end
end
