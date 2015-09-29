class TeamMembersController < ApplicationController
  def index
    @presented_team_members = BaseCollectionPresenter.new(collection: TeamMember.positioned, view_template: view_context, presenter: TeamMemberPresenter)
  end
end
