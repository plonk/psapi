require 'jimson'

module Psapi
  module PeercastStation
    class << self
      def initialize(host, port)
        @helper = Jimson::ClientHelper.new("http://#{host}:#{port}/api/1")
      end

    end

    def method_missing(*_args, &block)
      name, *args = _args

      helper = PeercastStation.instance_variable_get(:@helper)
      if args.size == 1 and args[0].is_a? Hash
        helper.process_call(name, *args, &block)
      else
        helper.process_call(name, args, &block)
      end
    rescue Jimson::Client::Error::ServerError => e
      STDERR.puts("method: #{name}, args: #{args.inspect}")
      fail
    end

  end

end
