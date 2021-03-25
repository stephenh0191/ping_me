class UsersinfoController < ApplicationController
  before_action :set_usersinfo, only: [:show, :edit, :update, :destroy]
  before_action :require_user, except: [:show, :index]
  before_action :require_same_user, only: [:edit, :update, :destroy]


  def show
     end

  def index
   @usersinfos = Userinfo.all
   @users = User.new

   end

 def new
    @usersinfo = Userinfo.new
  end

  def edit
  end

  def create
    @usersinfo = Userinfo.new(usersinfo_params)
    @usersinfo.user = current_user
    if @usersinfo.save
      flash[:notice] = "Info was created successfully."
      redirect_to usersinfo_path
    else
      render 'new'
    end
  end

  def update
    if @usersinfo.update(usersinfo_params)
      flash[:notice] = "Info was updated successfully."
      redirect_to usersinfo_path
    else
      render 'edit'
    end
  end

  def destroy
    @usersinfo.destroy
    redirect_to usersinfo_path
  end

  private

  def set_usersinfo
     @usersinfo = Userinfo.new(params[:id])
  end

  def usersinfo_params
    params.require(:usersinfo).permit(:title, :description, :user_id, :eduction, :from, :contactinfo, :company, :passions, :Jobtitle )
  end

  def require_same_user
    if current_user != @usersinfo.user && !current_user.admin?
      flash[:alert] = "You can only edit or delete your own article"
      redirect_to  usersinfo_path
    end
  end

end