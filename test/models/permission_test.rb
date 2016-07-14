require 'test_helper'

class PermissionTest < ActiveSupport::TestCase
  test "the truth" do
    permissions = Permission.load_permission_tree
    p permissions
    permissions = permissions.uniq
    permissions.sort! { |a, b| b[1] <=> a[1] }
    p permissions
    assert true
  end
end
