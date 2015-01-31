module PSAPI
  class VersionInfo < API_Object
    accessors_for %w(agentName apiVersion jsonrpc)

    def initialize(hash)
      mass_assign(hash)
    end

  end

end
