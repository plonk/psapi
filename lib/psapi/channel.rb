module PSAPI
  class Channel < API_Object
    define_all_with(:getChannels)
    def self.find(id)
      Channel.new({ 'channelId' => id, 'status' => getChannelStatus(id),
                    'info' => getChannelInfo(id)['info'] })
    rescue
      nil
    end

    attr_accessor :status, :info, :yellow_pages
    attr_accessor :track

    def initialize(hash = {})
      @status = Status.new(hash['status'] || {})
      @info   = Info.new(hash['info'] || {})
      @track  = Track.new(hash['track'])

      @yellow_pages = (hash['yellowPages'] || []).map(&YellowPage.method(:new))
    end

    class Connection
      attr_reader :id

      def restart
      end

      def stop
      end
    end

    def stop
    end

    def info=(channel_info)
    end

    def connections
    end

    def broadcast
    end

    def bump
    end

    def outputs
    end

    def relay_tree
      # tree of sessions
    end

    # このチャンネルの yellow_page へのアナウンス接続を切断する
    def stop_announce(yellow_page)
    end

    # このチャンネルの yellow_page へのアナウンス接続をはりなおす
    def restart_announce(yellow_page)
    end

    # 主にプレーヤーとの「ダイレクト接続」
    class Output
      def stop
      end
    end

    class Status < API_Object
      accessors_for %w(status source uptime localRelays localDirects totalRelays totalDirects isBroadcasting isRelayFull isDirectFull isReceiving)

      def initialize(hash)
        mass_assign(hash)
      end
    end

    class Info < API_Object
      accessors_for %w(name url genre desc comment bitrate contentType mimeType)

      def initialize(hash)
        mass_assign(hash)
      end

    end

    class Track < API_Object
      accessors_for %w(name genre album creator url)

      def initialize(hash)
        mass_assign(hash)
      end
    end

  end

end