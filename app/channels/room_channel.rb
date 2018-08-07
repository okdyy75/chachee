class RoomChannel < ApplicationCable::Channel
  def subscribed
    logger.debug("start #{self.class}::#{__method__}")
    stream_from "room_channel"
  end

  def unsubscribed
    logger.debug("start #{self.class}::#{__method__}")
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
    logger.debug("start #{self.class}::#{__method__}")
    result = Message.create(ssid: self.current_user, msg: data['msg'])
    MessageBroadcastJob.perform_later result
  end
end
