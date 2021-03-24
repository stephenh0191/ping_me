class UsersInfoController < ApplicationController
  before_action :set_userinfo, only: [:show, :edit, :update, :destroy]
  before_action :require_user, except: [:show, :index]
  before_action :require_same_user, only: [:edit, :update, :destroy]

  def show
  end

  def index
    @userinfos = UserInfo.all
  end

  def new
    @userinfo = UserInfo.new
  end

  def edit
  end

  def create
    @userinfo = UserInfo.new(userinfo_params)
    @userinfo.user = current_user
    if @article.save
      flash[:notice] = "Your information was created successfully."
      redirect_to user_path
    else
      render 'new'
    end
  end

  def update
    if @userinfo.update(userinfo_params)
      flash[:notice] = "Your information was updated successfully."
      redirect_to user_path
    else
      render 'edit'
    end
  end

  def destroy
    @userinfo.destroy
    redirect_to userinfo_path
  end

  private

  def set_userinfo
    @userinfo = UserInfo.find(params[:id])
  end

  def userinfo_params
    params.require(:userinfo).permit(:title, :description, :Jobtitle, :passions, :company,:contactinfo, :from, :eduction)
  end
 
  def require_same_user
    if current_user != @userinfo.user && !current_user.admin?
      flash[:alert] = "You can only edit or delete your own information"
      redirect_to @userinfo
    end
  end

end
end
