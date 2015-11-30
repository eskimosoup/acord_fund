class TeamMemberPresenter < BasePresenter
  presents :team_member
  delegate :name, :role, to: :team_member

  def biography
    h.raw team_member.biography if team_member.biography.present?
  end
end
