class RoomsController < ApplicationController
  def show
    logger.debug("start #{self.class}::#{__method__}")
    @messages = Message.all.order(created_at: "desc").limit(10)
  end
end
