module Optimadmin
  class LeaderboardPresenter < Optimadmin::BasePresenter
    presents :leaderboard
    delegate :id, :title, :area, to: :leaderboard
  end
end
