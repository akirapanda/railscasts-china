class Admin::TagsController < Admin::BaseController
  before_action :fetch_tag, only: [:show, :edit, :update,:destroy]


  def index
    @q = Tag.search(params[:q])
    @tags = @q.result(distinct: true)
    @tags_grid = initialize_grid(@tags)
  end

  def show
    @episodes_grid = initialize_grid(@tag.episodes)
  end

  def edit

  end

  def create

  end

  def update

  end

  def destroy

  end

  private 

  def fetch_tag
    @tag ||= Tag.find_by(:name=>params[:id])
  end
end

