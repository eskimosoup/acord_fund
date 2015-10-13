class Partner < ActiveRecord::Base
  mount_uploader :image, PartnerUploader

  validates :name, :image, presence: true

  scope :footer, -> { where(display_in_footer: true) }
  scope :partners_page, -> { where(display_on_partners_page: true) }
  scope :positioned, -> { order(:position) }
end
