module Psapi
  class Settings < API_Object
    # チャンネルの自動切断
    class ChannelCleaner < API_Object
      def initialize(hash)
        super
      end

      attr_accessor :inactive_limit, :mode

      def mode_string
        case mode
        when 0
          '(自動切断しない)'
        when 1
          '接続していない'
        when 2
          '視聴・リレーしていない'
        when 3
          '視聴していない'
        end

      end
    end

    attr_accessor :max_relays, :max_relays_per_channel, :max_directs, :max_directs_per_channel, :max_upstream_rate, :max_upstream_rate_per_channel

    def initialize(hash)
      super
    end

    def channel_cleaner
      ChannelCleaner.new(@channel_cleaner)
    end

  end

end
