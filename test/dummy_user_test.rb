require 'test_helper'

module Tuberack
  describe DummyUser do 
    let(:user) { DummyUser.new }

    it "shouln't have role as default" do 
      user.has_role?(:someone).must_equal nil
    end

    it 'should have detect role' do 
      user.roles = 'admin,user'
      user.has_role?(:admin).must_equal true
      user.has_role?(:user).must_equal true
      user.has_role?(:someone).must_equal false
    end

    it 'should be the same' do
      user.xeditable?.must_equal nil
      user.xeditable = true
      user.xeditable?.must_equal true
      user.manage?.must_equal nil
      user.manage = true
      user.manage?.must_equal true
    end
  end
end