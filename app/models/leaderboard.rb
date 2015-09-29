class Leaderboard < ActiveRecord::Base
  mount_uploader :image, LeaderboardUploader

  validates :title, :area, :image, presence: true

  scope :displayed, -> { where(display: true) }
  scope :area, -> (area) { find_by(area: area).displayed }

  AREAS = ['Home page - section 3']
end
