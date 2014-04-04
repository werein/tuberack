require_relative 'test_helper'

module Tuberack
  describe DummyController do
    let(:controller)  { DummyController.new }

    it 'should create and keep current user' do
      controller.current_user.must_be_kind_of DummyUser

      user = controller.current_user
      DummyController.new.current_user.must_equal user
    end

    describe 'with current user' do
      let(:user)        { DummyUser.new }
      before do
        controller.stubs(:current_user).returns(user)
      end

      it 'must have same xeditable value as user' do
        user.xeditable = true
        controller.xeditable?(nil).must_equal true
        user.xeditable = false
        controller.xeditable?(nil).must_equal false
      end

      it 'must have same manage value as user' do
        user.manage = true
        controller.manage?.must_equal true
        user.manage = false
        controller.manage?.must_equal false
      end

      it 'must change user roles' do
        controller.stubs(:params).returns({role: 'admin,user'})
        controller.__send__(:changes)
        controller.current_user.roles.must_equal 'admin,user'
        controller.stubs(:params).returns({role: 'clear'})
        controller.__send__(:changes)
        controller.current_user.roles.must_equal nil
      end

      it 'must change user' do
        controller.expects(:set_user)
        controller.stubs(:params).returns({user: '1'})
        controller.__send__(:changes)
      end

      it 'must load or create user' do 
        controller.stubs(:params).returns({user: '1'})
        controller.__send__(:set_user).must_equal DummyUser.find(1)
      end

      it 'must load or create user' do 
        controller.stubs(:params).returns({user: 'fail'})
        controller.__send__(:set_user).must_equal nil
      end

      it 'must change current user xeditable on true' do
        controller.stubs(:params).returns({xeditable: 'true'})
        controller.__send__(:changes)
        controller.current_user.xeditable?.must_equal true
        controller.stubs(:params).returns({xeditable: '1'})
        controller.__send__(:changes)
        controller.current_user.xeditable?.must_equal true
      end

      it 'must change current user xeditable on false' do
        controller.stubs(:params).returns({xeditable: 'false'})
        controller.__send__(:changes)
        controller.current_user.xeditable?.must_equal false
        controller.stubs(:params).returns({xeditable: '0'})
        controller.__send__(:changes)
        controller.current_user.xeditable?.must_equal false
      end

      it 'must change current user manage on true' do
        controller.stubs(:params).returns({manage: 'true'})
        controller.__send__(:changes)
        controller.current_user.manage?.must_equal true
        controller.stubs(:params).returns({manage: '1'})
        controller.__send__(:changes)
        controller.current_user.manage?.must_equal true
      end

      it 'must change current user manage on false' do
        controller.stubs(:params).returns({manage: 'false'})
        controller.__send__(:changes)
        controller.current_user.manage?.must_equal false
        controller.stubs(:params).returns({manage: '0'})
        controller.__send__(:changes)
        controller.current_user.manage?.must_equal false
      end
    end
  end
end