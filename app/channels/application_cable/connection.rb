module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_user

    def connect
      logger.debug("start #{self.class}::#{__method__}")

      if cookies[:ssid].nil?
        self.current_user = 0
      else
        self.current_user = cookies[:ssid]
      end
    end

  end
end
