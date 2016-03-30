class Admin::UsersController < Admin::BaseController
  before_action :fetch_user, only: [:show, :edit, :update]


  def index
    @q = User.search(params[:q])
    @users = @q.result(distinct: true)
    @users_grid = initialize_grid(@users)
  end

  def show
    
  end

  
  private 

  def fetch_user
    @user ||= User.find(params[:id])
  end
end

