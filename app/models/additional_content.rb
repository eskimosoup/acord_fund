class AdditionalContent < ActiveRecord::Base
  mount_uploader :image, AdditionalContentUploader

  validates :content, presence: true, if: "title.blank?"
  #validates :area, presence: true, uniqueness: true
  validates :button_text, presence: true, if: "button_link.present?"
  validates :button_link, presence: true, if: "button_text.present?"

  scope :displayed, -> { where(display: true) }

  AREAS = [['Home page - section 1 (with news widget)', 'home_page_section_1'],
           ['Home page - section 2 (image left)', 'home_page_section_2'],
           ['Home page - section 3 (video right)', 'home_page_section_3'],
           ['Downloads introduction', 'downloads_introduction'],
           ['Partners', 'partners'],
           ['Articles Index', 'articles_index'],
           ['Contact us page - General Enquiries', 'contact_us_0_general_enquiries'],
           ['Contact us page - Acorn Fund', 'contact_us_1_acorn_fund'],
           ['Contact us page - Startup Loan enquiries', 'contact_us_2_startup_loan_enquiries'],
           ['Contact us page - Other Contact Details', 'contact_us_other_contact_details'],
           ['Team Members', 'team_members']
          ]
end
