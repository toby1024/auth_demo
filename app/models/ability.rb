class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    ajax_not_role
    ## 指定超级用户
    if user.has_role?('Admin')
      can :manage, :all
    else
      user.roles.each { |role|
        role.permissions.each { |p|
          begin
            action = p.action.to_sym
            subject = p.subject.constantize
            can action, subject
          rescue => e
            Rails.logger.info "#{e}"
            Rails.logger.info "#{subject}"
          end
        }
      }
    end
  end

  def ajax_not_role
    can :get_menus_by_module, Permission
    can :load_permission_tree, Permission
    can :load_menu, Item
    can :get_user_menus, Item
  end
end
