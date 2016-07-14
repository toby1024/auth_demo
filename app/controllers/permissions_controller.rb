class PermissionsController < ApplicationController
  load_and_authorize_resource
  before_filter :set_global_search_variable, :only => :index

  def set_global_search_variable
    params[:q] ||= ActionController::Parameters.new
    @q = Permission.search(params[:q])
  end

  def index
    @permissions = @q.result.page(@page).per(@pageSize)
  end

  # POST /permissions
  def create
    @permission = Permission.new(permission_params)
    if @permission.save
      redirect_to permissions_url, notice: '创建权限成功.'
    else
      render :new
    end
  end

  # GET /permissions
  #ajax get module_name for permission edit from items
  def get_menus_by_module
    module_name = params[:permission][:module_name]
    render :json => Item.find_menu_by_module_name(module_name).as_json({:only => [:name]})
  end

  # GET /permissions/load_permission_tree
  # get permission tree for zTree
  def load_permission_tree
    render :json => Permission.load_permission_tree.to_json
  end

  private
  def permission_params
    params.require(:permission).permit(:id, :description, :action, :subject)
  end
end
