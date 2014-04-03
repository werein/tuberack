require_relative 'test_helper'

module Tuberack
  describe DummyController do

    it 'should create and keep current user' do
      DummyController.new.current_user.must_be_kind_of DummyUser

      user = DummyController.new.current_user
      DummyController.new.current_user.must_equal user
    end

    describe 'with current user' do
      let(:user)  { DummyUser.new }
      before do
        DummyController.any_instance.stubs(:current_user).returns(user)
      end

      it 'must have same xeditable value as user' do
        user.xeditable = true
        DummyController.new.xeditable?(nil).must_equal true
        user.xeditable = false
        DummyController.new.xeditable?(nil).must_equal false
      end

      it 'must have same manage value as user' do
        user.manage = true
        DummyController.new.manage?.must_equal true
        user.manage = false
        DummyController.new.manage?.must_equal false
      end

      it 'must change user roles' do
        DummyController.any_instance.stubs(:params).returns({role: 'admin,user'})
        DummyController.new.__send__(:changes)
        DummyController.new.current_user.roles.must_equal 'admin,user'
        DummyController.any_instance.stubs(:params).returns({role: 'clear'})
        DummyController.new.__send__(:changes)
        DummyController.new.current_user.roles.must_equal nil
      end

      it 'must change user id' do
        DummyController.any_instance.stubs(:params).returns({user_id: '1'})
        DummyController.new.__send__(:changes)
        DummyController.new.current_user.id.must_equal '1'
        DummyController.any_instance.stubs(:params).returns({user_id: 'clear'})
        DummyController.new.__send__(:changes)
        DummyController.new.current_user.id.must_equal nil
      end

      it 'must change current user xeditable on true' do
        DummyController.any_instance.stubs(:params).returns({xeditable: 'true'})
        DummyController.new.__send__(:changes)
        DummyController.new.current_user.xeditable?.must_equal true
        DummyController.any_instance.stubs(:params).returns({xeditable: '1'})
        DummyController.new.__send__(:changes)
        DummyController.new.current_user.xeditable?.must_equal true
      end

      it 'must change current user xeditable on false' do
        DummyController.any_instance.stubs(:params).returns({xeditable: 'false'})
        DummyController.new.__send__(:changes)
        DummyController.new.current_user.xeditable?.must_equal false
        DummyController.any_instance.stubs(:params).returns({xeditable: '0'})
        DummyController.new.__send__(:changes)
        DummyController.new.current_user.xeditable?.must_equal false
      end

      it 'must change current user manage on true' do
        DummyController.any_instance.stubs(:params).returns({manage: 'true'})
        DummyController.new.__send__(:changes)
        DummyController.new.current_user.manage?.must_equal true
        DummyController.any_instance.stubs(:params).returns({manage: '1'})
        DummyController.new.__send__(:changes)
        DummyController.new.current_user.manage?.must_equal true
      end

      it 'must change current user manage on false' do
        DummyController.any_instance.stubs(:params).returns({manage: 'false'})
        DummyController.new.__send__(:changes)
        DummyController.new.current_user.manage?.must_equal false
        DummyController.any_instance.stubs(:params).returns({manage: '0'})
        DummyController.new.__send__(:changes)
        DummyController.new.current_user.manage?.must_equal false
      end
    end
  end
end