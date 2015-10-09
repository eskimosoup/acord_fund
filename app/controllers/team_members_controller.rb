class TeamMembersController < ApplicationController
  def index
    @presented_additional_content = AdditionalContentPresenter.new(object: AdditionalContent.displayed.find_by(area: 'team_members'), view_template: view_context)
    @presented_team_members = BaseCollectionPresenter.new(collection: TeamMember.positioned, view_template: view_context, presenter: TeamMemberPresenter)
  end
end
