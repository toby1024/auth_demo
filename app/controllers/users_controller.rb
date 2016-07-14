class UsersController < ApplicationController
  load_and_authorize_resource

  before_filter :set_global_search_variable, :only => :index

  def set_global_search_variable
    params[:q] ||= ActionController::Parameters.new
    params[:q][:status_eq] ||= 1
    @q = User.search(params[:q])
  end

  # GET /users
  def index
    @users = @q.result.page(@page).per(@pageSize)
  end

  def create
    if @user.save
      logger.info "#{current_user.username}创建用户#{@user.username}"
      redirect_to users_path
    else
      render :new
    end
  end

  def update
    if @user.update(user_params)
      logger.info "#{current_user.username}修改用户#{@user.username}==》#{user_params}"
      redirect_to :users, notice: '用户信息已更新.'
    else
      render :edit
    end
  end

  def destroy
    @user.update(:status => 0)
    logger.info "#{current_user.username}删除用户#{@user.username}"
    redirect_to :users, notice: '用户已被删除.'
  end

  private
  def user_params
    params.require(:user).permit(:id, :email, :phone, :company, :password, :username,:f_code, :role_ids => [])
  end
end
