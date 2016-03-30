class Admin::EpisodesController < Admin::BaseController
  before_action :fetch_episode, only: [:show, :edit, :update]

  def index
    @q = Episode.search(params[:q])
    @episodes = @q.result(distinct: true)
    @episodes_grid = initialize_grid(@episodes)
  end

  def show
  end

  def new
    @episode = Episode.new
  end


  def edit
  end

  def create
    @episode = Episode.new(episode_params)
    if @episode.save
      redirect_to @episode, notice: "Episode created successfully."
    else
      render :new
    end
  end

  def update
    if @episode.update_attributes(episode_params)
      redirect_to @episode, notice: "Episode updated successfully."
    else
      render :edit
    end
  end


  private
  
  def episode_params
    params.require(:episode).permit(:name, :permalink, :notes, :description,
                                    :still, :publish, :tag_list, :seconds, :video_url, :download_url, :election_id,
                                    :allow_download, :allow_comment)
  end

  def fetch_episode
    @episode ||= Episode.find_by(permalink: params[:id])
  end
end

