class DownloadsController < ApplicationController
  def index
    @presented_downloads = BaseCollectionPresenter.new(collection: Download.displayed.ordered, view_template: view_context, presenter: DownloadPresenter)
  end
end
