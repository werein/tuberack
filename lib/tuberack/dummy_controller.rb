require 'tuberack/dummy_user'

module Tuberack
  class DummyController < ActionController::Base
    before_action :changes

    def current_user
      @@current_user ||= DummyUser.new
    end
    helper_method :current_user

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
        @@current_user = set_user if params[:user]
        current_user.manage = params[:manage] =~ /(true|1|on)/ ? true : false if params[:manage]
        current_user.xeditable = params[:xeditable] =~ /(true|1|on)/ ? true : false if params[:xeditable]
        current_user.roles = params[:role] == 'clear' ? nil : params[:role] if params[:role]
      end

      def set_user
        if params[:user].to_i == 0
          nil
        else
          DummyUser.find_or_create_by(id: params[:user].to_i) unless current_user.id == params[:user].to_i
        end
      end
  end
end