class TeamMemberPresenter < BasePresenter
  presents :team_member
  delegate :name, :role, to: :team_member
end
