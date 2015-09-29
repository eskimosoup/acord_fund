class LeaderboardPresenter < BasePresenter
  presents :leaderboard
  delegate :title, to: :leaderboard

  def leaderboard_link(content)
    if leaderboard.link.present?
      h.link_to content, leaderboard.link, title: title, target: '_blank'
    else
      content
    end
  end
end
