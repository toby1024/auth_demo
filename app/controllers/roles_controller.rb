class RolesController < ApplicationController
  load_and_authorize_resource

  before_filter :set_global_search_variable, :only => :index

  def set_global_search_variable
    params[:q] ||= ActionController::Parameters.new
    @q = Role.search(params[:q])
  end

  # GET /roles
  def index
    @roles = @q.result.page(@page).per(@pageSize)
  end


  # POST /roles
  def create
    @role = Role.new(role_params)
    if @role.save
      redirect_to roles_path
    else
      render :new
    end
  end

  # PATCH/PUT /roles/1
  def update
    if @role.update(role_params)
      redirect_to roles_path, notice: '修改角色成功.'
    else
      render :edit
    end
  end

  # DELETE /roles/1
  def destroy
    @role.destroy
    redirect_to "/roles", notice: '删除角色成功.'
  end

  private
  def role_params
    params.require(:role).permit(:id, :name, :description, :item_ids => [],:permission_ids => [])
  end
end
