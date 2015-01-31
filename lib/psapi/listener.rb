module PSAPI
  class Listener
    class << self
      def all
        getListeners.map(&Listener.method(:new))
      end
    end

    def reset_authentication_key
    end

    # listener が受け付けるコネクションの種類を設定する
    def local_accepts=(accepts)
    end

    def global_accepts=(accepts)
    end

    attr_reader :local_accepts, :global_accepts

    def local_authorization_required=(bool)
    end

    def global_authorization_required=(bool)
    end

    def local_authorization_required?
    end

    def global_authorization_required?
    end

    def remove
    end
  end

end
