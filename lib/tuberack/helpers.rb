module Tuberack
  module Helpers
    def integration_login
      current_user.stubs(:has_role?).returns(true)
      login_as current_user
    end

    def user_ability role
      current_user.stubs(:has_role?).returns(false)
      current_user.stubs(:has_role?).with(role).returns(true)
      current_user
    end

    def ability
      @ability = Object.new
      @ability.extend(CanCan::Ability)
      @controller.stubs(:current_user).returns(current_user)
      @controller.stubs(:current_ability).returns(@ability)
    end

    def can object
      ability unless defined? @ability
      @ability.can :manage, object
    end

    def cannot object
      ability unless defined? @ability
      @ability.cannot :manage, object
    end
  end
end