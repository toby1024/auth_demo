class User < ActiveRecord::Base
  rolify
  has_and_belongs_to_many :roles, :join_table => :users_roles
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable, :authentication_keys => [:phone]
  validates_presence_of :username, :message => "用户名不能为空", :on => :create
  validates_presence_of :email, :message => "邮箱不能为空", :on => :create
  validates_uniqueness_of :email, :case_sensitive => false, :message => "该邮箱已经存在", :on => :create
  validates_presence_of :phone, :message => "邮箱不能为空", :on => :create
  validates_uniqueness_of :phone, :case_sensitive => false, :message => "该手机号码已经存在", :on => :create
  validates_presence_of :password, :message => "密码不能为空", :on => :create
  validates_presence_of :f_code, :message => "F码不能为空", :on => :create

  def has_role?(role_name)
    role_names = roles.pluck(:name)
    return role_names.include?(role_name)
  end
end
