module Optimadmin
  class TeamMemberPresenter < Optimadmin::BasePresenter
    presents :team_member
    delegate :id, :name, :role, to: :team_member

    def toggle_title
      inline_detail_toggle_link(name)
    end
  end
end
