module Tuberack
  class DummyUser < ActiveRecord::Base
    attr_accessor :roles, :xeditable, :manage

    def has_role? role
      roles.split(',').include? role.to_s if roles
    end

    def xeditable?; xeditable end
    def manage?; manage end
  end
end