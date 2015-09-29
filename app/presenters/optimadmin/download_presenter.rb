module Optimadmin
  class DownloadPresenter < Optimadmin::BasePresenter
    presents :download
    delegate :id, :title, to: :download

    def preview_link
      h.link_to eye, download.file.url, class: 'menu-item-control'
    end
  end
end
