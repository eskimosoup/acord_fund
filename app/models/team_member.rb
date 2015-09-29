class TeamMember < ActiveRecord::Base
  validates :name, :role, presence: true

  scope :displayed, -> { where(display: true) }
  scope :positioned, -> { displayed.order(:position) }
end
