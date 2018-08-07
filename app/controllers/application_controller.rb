require 'digest/md5'
require 'yaml'

class ApplicationController < ActionController::Base
  before_action :access

  private
  def access
    logger.debug("start #{self.class}::#{__method__}")

    ssid = cookies[:ssid]

    if ssid.nil?
      remote_ip = request.env["HTTP_X_FORWARDED_FOR"] || request.remote_ip || 0
      time = DateTime.now.strftime("%Y%m%d%H%I%S")
      ssid = Digest::MD5.hexdigest(remote_ip + time)
      cookies[:ssid] = ssid
    end

    logger.debug(ssid);
  end

end
