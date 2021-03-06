module Psapi
  class YellowPage < API_Object
    define_all_with(:getYellowPages)

    accessors_for %w(name uri yellowPageId)
    attr_reader :announcings

    def initialize(hash)
      super
      @announcings = hash['channels'].map { |h|
        Announcing.new(h)
      }
      @protocol = hash['protocol']
    end

    def protocol
      Protocol.all.find { |prot| prot.protocol == @protocol } or
        fail "yellow page protocol #{@protocol} not found"
    end

    # 掲載しているチャンネル
    class Announcing < API_Object
      accessors_for %w(channelId status)

      def channel
        Channel.find(channel_id)
      end

    end

    def save
    end

    def remove
    end

    class Protocol < API_Object
      define_all_with(:getYellowPageProtocols)
      accessors_for %w(name protocol)

    end

  end

end
