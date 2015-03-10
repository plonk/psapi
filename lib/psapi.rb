# PeerCast Station API
require_relative 'psapi/peercast_station'

module PSAPI
  class << self
    include PeercastStation

    def check_bandwidth
      checkBandwidth
    end

    def check_ports
      checkPorts
    end

    def check_update
    end

    def new_versions
    end

    def settings
      Settings.new(getSettings)
    end

    def settings=(new_settings)
    end

    def status
      Status.new(getStatus)
    end

    def version_info
      VersionInfo.new(getVersionInfo)
    end
  end

  module Internal
    def camel_to_snake(identifier)
      fail ArgumentError, '予想外です' unless identifier =~ /\A[A-Za-z]+\z/
      identifier
        .scan(/(?:[A-Za-z][a-z]+|[A-Z]+(?![a-z]))/)
        .map(&:downcase)
        .join('_')
    end
    module_function :camel_to_snake
  end

end

require_relative 'psapi/api_object'
require_relative 'psapi/broadcast_history'
require_relative 'psapi/channel'
require_relative 'psapi/content_reader'
require_relative 'psapi/listener'
require_relative 'psapi/log'
require_relative 'psapi/notification_message'
require_relative 'psapi/plugin'
require_relative 'psapi/session'
require_relative 'psapi/settings'
require_relative 'psapi/source_stream'
require_relative 'psapi/status'
require_relative 'psapi/version_description'
require_relative 'psapi/version_info'
require_relative 'psapi/yellow_page'
