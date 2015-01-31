module PSAPI
  class Channel < API_Object
    define_all_with(:getChannels)
    def self.find(id)
      Channel.new({ 'channelId' => id, 'status' => getChannelStatus(id) }.merge(getChannelInfo(id)))
    end

    attr_accessor :status, :info
    attr_accessor :track

    def initialize(hash = {})
      @status = Status.new(hash['status'] || {})
      @info   = Info.new(hash['info'] || {})
      @track  = Track.new(hash['track'])

      @yellow_pages = (hash['yellowPages'] || [])
    end

    def yellow_pages
      yps = YellowPage.all
      @yellow_pages.map { |yellowPageId:|
        yps.find { |y| y.yellow_page_id == yellowPageId } or fail "yellow page id #{yellowPageId} not found"
      }
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

    end

    class Info < API_Object
      accessors_for %w(name url genre desc comment bitrate contentType mimeType)

    end

    class Track < API_Object
      accessors_for %w(name genre album creator url)

    end

  end

end
