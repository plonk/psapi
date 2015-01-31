module PSAPI
  class Status < API_Object
    accessors_for %w(uptime isFirewalled globalRelayEndPoint globalDirectEndPoint
                     localRelayEndPoint localDirectEndPoint)
  end

end
