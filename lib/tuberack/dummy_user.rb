module Tuberack
  class DummyUser
    attr_accessor :roles, :id, :xeditable, :manage

    def has_role? role
      roles.split(',').include? role.to_s if roles
    end

    def xeditable?; xeditable end
    def manage?; manage end
  end
end