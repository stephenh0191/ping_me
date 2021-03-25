class UserinfosController < ApplicationController
  before_action :set_userinfo, only: [:show, :edit, :update, :destroy]
  before_action :require_user, except: [:show, :index]
  before_action :require_same_user, only: [:edit, :update, :destroy]


  def show
       @userinfos = Userinfo.all
  end

  def index
   @userinfos = Userinfo.all
   end

 def new
    @usersinfo = Userinfo.new
  end

  def edit
  end

  def create
    @userinfo = Userinfo.new(userinfo_params)
    @userinfo.user = current_user
    if @userinfo.save
      flash[:notice] = "Info was created successfully."
      redirect_to userinfos_path
    else
      render 'new'
    end
  end

  def update
    if @userinfo.update(userinfo_params)
      flash[:notice] = "Info was updated successfully."
      redirect_to userinfos_path
    else
      render 'edit'
    end
  end

  def destroy
    @userinfo.destroy
    redirect_to userinfos_path
  end

  private

  def set_userinfo
     @userinfo = Userinfo.new(params[:id])
  end

  def userinfo_params
    params.require(:userinfo).permit(:title, :description, :user_id, :eduction, :from, :contactinfo, :company, :passions, :Jobtitle )
  end

  def require_same_user
    if current_user != @userinfo.user && !current_user.admin?
      flash[:alert] = "You can only edit or delete your own article"
      redirect_to  userinfos_path
    end
  end

end