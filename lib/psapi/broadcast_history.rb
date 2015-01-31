module PSAPI
  class BroadcastHistory < API_Object
    class << self
      include PeercastStation
      def all
        getBroadcastHistory.map do |hist|
          BroadcastHistory.new(hist)
        end
      end
    end

    accessors_for %w(streamType streamUrl bitrate contentType
                     yellowPage channelName genre description
                     comment contactUrl trackTitle trackAlbum
                     trackArtist trackGenre trackUrl favorite)

    def initialize(hash = {})
      mass_assign(hash)
    end

    def save
      addBroadcastHistory(info: to_hash)
    end

  end

end
