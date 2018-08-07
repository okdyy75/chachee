class MessageBroadcastJob < ApplicationJob
  queue_as :default

  def perform(messages)
    logger.debug("start #{self.class}::#{__method__}")
    ActionCable.server.broadcast 'room_channel', render_message(messages)
  end

  private
    def render_message(data)
      logger.debug("start #{self.class}::#{__method__}")
      messages = Message.all.order(created_at: "desc").limit(10)
      ApplicationController.renderer.render(partial: "messages/messages", locals: { messages: messages })
    end
end
