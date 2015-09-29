class DownloadPresenter < BasePresenter
  presents :download
  delegate :title, to: :download

  def download_link
    h.link_to title, download.file.url, title: title
  end
end
