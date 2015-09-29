class Partner < ActiveRecord::Base
  mount_uploader :image, PartnerUploader

  validates :name, :image, presence: true

  scope :displayed, -> { where(display: true) }
  scope :positioned, -> { displayed.order(:position) }
end
