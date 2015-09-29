class AdditionalContent < ActiveRecord::Base
  mount_uploader :image, AdditionalContentUploader

  validates :content, presence: true
  validates :area, presence: true, uniqueness: true
  validates :button_text, presence: true, if: "button_link.present?"
  validates :button_link, presence: true, if: "button_text.present?"

  scope :displayed, -> { where(display: true) }

  AREAS = ['Home page - section 1 (with news widget)',
           'Home page - section 2 (image left)',
           'Home page - section 3 (video right)',
           'Downloads introduction',
           'Contact page details'
          ]
end
