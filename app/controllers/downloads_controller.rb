class DownloadsController < ApplicationController
  def index
    @presented_downloads_text = AdditionalContentPresenter.new(object: AdditionalContent.displayed.find_by(area: 'downloads_introduction'), view_template: view_context)
    @presented_downloads = BaseCollectionPresenter.new(collection: Download.displayed.ordered, view_template: view_context, presenter: DownloadPresenter)
  end
end
