class ApplicationController < ActionController::Base

  rescue_from ActiveRecord::RecordNotFound do |exception|
    render_error 404
  end

  def render_error(status)
    respond_to do |format|
      format.html { render 'errors/404', status: status }
      format.all { render nothing: true, status: status }
    end
  end

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :global_site_settings, :load_objects

  def index
    @banner_menu = Optimadmin::Menu.new(name: "home_page_banner")
    @presented_home_sections = BaseCollectionPresenter.new(collection: AdditionalContent.displayed.where("area LIKE ?", "home_page_%").order(:area), view_template: view_context, presenter: AdditionalContentPresenter)
    @presented_team_members = BaseCollectionPresenter.new(collection: TeamMember.positioned, view_template: view_context, presenter: TeamMemberPresenter)
    @presented_article = ArticlePresenter.new(object: Article.displayed.ordered.first, view_template: view_context)
    @presented_leaderboard = LeaderboardPresenter.new(object: Leaderboard.area('Home page - section 3'), view_template: view_context)
  end


  private

    def load_objects
      @presented_partners = BaseCollectionPresenter.new(collection: Partner.footer.positioned, view_template: view_context, presenter: PartnerPresenter)
      @header_menu = Optimadmin::Menu.new(name: "header")
      @contact = Contact.new
    end

    def global_site_settings
      @global_site_settings ||= Optimadmin::SiteSetting.current_environment
    end
    helper_method :global_site_settings
end
