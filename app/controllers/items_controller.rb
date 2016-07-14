class ItemsController < ApplicationController
  load_and_authorize_resource
  before_filter :set_global_search_variable, :only => :index

  def set_global_search_variable
    params[:q] ||= ActionController::Parameters.new
    params[:q][:status_eq] ||= 1
    @q = Item.search(params[:q])
  end

  # GET /items
  def index
    @items = @q.result.page(@page).per(@pageSize)
  end

  # POST /items
  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to items_url, notice: '创建菜单成功.'
    else
      render :new
    end
  end

  # PATCH/PUT /items/1
  def update
    if @item.update(item_params)
      logger.info "#{current_user}修改菜单#{@item.name}"
      redirect_to items_url, notice: '菜单已被修改.'
    else
      render :edit
    end
  end

  # DELETE /items/1
  def destroy
    @item.update(:status => 0)
    redirect_to items_url, notice: '删除菜单成功.'
  end

  def load_menu
    respond_to do |format|
      format.json { render json: Item.where(:status => 1).to_json }
    end
  end

  def get_user_menus
    user = User.find(current_user.id)
    roles = user.roles.pluck(:id)
    menus = []
    roles.each { |role_id|
      role = Role.find(role_id)
      menus += role.items.pluck(:id, :name, :url, :pid, :order_number)
    }
    menus = menus.uniq
    menus.sort! { |a, b| b[4] <=> a[4] }
    respond_to do |format|
      format.json { render json: menus.to_json }
    end
  end

  private

  # Never trust parameters from the scary internet, only allow the white list through.
  def item_params
    params.require(:item).permit(:name, :url, :order_number, :pid)
  end

end
