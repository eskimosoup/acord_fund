class AdditionalContent < ActiveRecord::Base
  mount_uploader :image, AdditionalContentUploader

  validates :content, presence: true
  validates :area, presence: true, uniqueness: true
  validates :button_text, presence: true, if: "button_link.present?"
  validates :button_link, presence: true, if: "button_text.present?"

  scope :displayed, -> { where(display: true) }

  AREAS = [['Home page - section 1 (with news widget)', 'home_page_section_1'],
           ['Home page - section 2 (image left)', 'home_page_section_2'],
           ['Home page - section 3 (video right)', 'home_page_section_3'],
           ['Downloads introduction', 'downloads_introduction'],
           ['Contact us page details', 'contact_us']
          ]
end
