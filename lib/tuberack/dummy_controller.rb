require 'tuberack/dummy_user'

module Tuberack
  class DummyController < ActionController::Base
    before_action :changes

    def current_user
      @@current_user ||= DummyUser.new
    end

    def xeditable? object
      current_user.xeditable?
    end
    helper_method :xeditable?

    def manage?
      current_user.manage?
    end
    helper_method :manage?

    private
      def changes
        current_user.manage = params[:manage] =~ /(true|1)/ ? true : false if params[:manage]
        current_user.xeditable = params[:xeditable] =~ /(true|1)/ ? true : false if params[:xeditable]
        current_user.roles = params[:role] == 'clear' ? nil : params[:role] if params[:role]
        current_user.id = params[:user_id] == 'clear' ? nil : params[:user_id] if params[:user_id]
      end
  end
end