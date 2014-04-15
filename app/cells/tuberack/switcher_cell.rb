module Tuberack
  class SwitcherCell < Cell::Rails

    def show user
      @tuberack_user = user
      render
    end
  end
end