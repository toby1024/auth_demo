class Item < ActiveRecord::Base
  validates_presence_of :name, :message => "菜单名称不能为空"
  validates_uniqueness_of :name, :case_sensitive => false, :message => "菜单名称已被占用", :on => :create
  validates_presence_of :url, :message => "菜单url不能为空"
  validates_presence_of :order_number, :message => "菜单排序不能为空"
  validates_numericality_of :order_number, :only_integer => true, :message => "必须为数字"

  def parent
    if self.pid
      Item.find(pid)
    end
  end

  def self.find_module_menus
    Item.where(:status => 1, :pid => nil).order("order_number desc")
  end

  def self.find_menu_by_module_name(module_name)
    item = Item.find_by(:name => module_name)
    if item
      Item.where("pid = ?", item.id)
    end
  end

end
