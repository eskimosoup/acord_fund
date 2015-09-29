module Optimadmin
  class LeaderboardsController < Optimadmin::ApplicationController
    before_action :set_leaderboard, only: [:show, :edit, :update, :destroy]

    edit_images_for Leaderboard, [[:image, { show: ['fit', 200, 200] }]]

    def index
      @leaderboards = Optimadmin::BaseCollectionPresenter.new(collection: Leaderboard.where('title ILIKE ?', "%#{params[:search]}%").order(area: :asc).page(params[:page]).per(params[:per_page] || 15), view_template: view_context, presenter: Optimadmin::LeaderboardPresenter)
    end

    def show
    end

    def new
      @leaderboard = Leaderboard.new
    end

    def edit
    end

    def create
      @leaderboard = Leaderboard.new(leaderboard_params)
      if @leaderboard.save
        redirect_to leaderboards_url, notice: 'Leaderboard was successfully created.'
      else
        render :new
      end
    end

    def update
      if @leaderboard.update(leaderboard_params)
        redirect_to leaderboards_url, notice: 'Leaderboard was successfully updated.'
      else
        render :edit
      end
    end

    def destroy
      @leaderboard.destroy
      redirect_to leaderboards_url, notice: 'Leaderboard was successfully destroyed.'
    end

  private


    def set_leaderboard
      @leaderboard = Leaderboard.find(params[:id])
    end

    def leaderboard_params
      params.require(:leaderboard).permit(:title, :area, :image, :image_cache, :remove_image, :remote_image_url, :display, :link)
    end
  end
end
