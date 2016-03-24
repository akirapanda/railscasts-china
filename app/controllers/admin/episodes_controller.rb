class Admin::EpisodesController < Admin::BaseController
  before_action :fetch_episode, only: [:show, :edit, :update]

  def index
    @q = Episode.search(params[:q])
    @episodes = @q.result(distinct: true)
    @episodes_grid = initialize_grid(@episodes)
  end

  def show
  end

  private

  def fetch_episode
    @episode ||= Episode.find_by(permalink: params[:id])
  end
end

