module PSAPI
  class Listener < API_Object
    define_all_with :getListeners

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
