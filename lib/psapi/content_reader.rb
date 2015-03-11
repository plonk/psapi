module Psapi
  class ContentReader
    class << self
      def all
        getContentReaders.map(&ContentReader.method(:new))
      end
    end
  end

end
