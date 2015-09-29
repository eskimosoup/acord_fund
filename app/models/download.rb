class Download < ActiveRecord::Base
  mount_uploader :file, DownloadUploader

  validates :title, presence: true, uniqueness: { case_sensitive: false }
  validates :file, presence: true


  scope :displayed, -> { where(display: true) }
  scope :ordered, -> { displayed.order(title: :asc) }

  #before_save :store_file, if: Proc.new{|page| page.remote_file_url.blank? }

  # def store_file
  #   Optimadmin::Document.store_file(self, file) if file.present? && file_changed?
  # end
end
