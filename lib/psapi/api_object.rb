module Psapi
  class API_Object
    include PeercastStation
    include Internal

    class << self
      include Internal

      def inherited(klass)
        klass.singleton_class.__send__(:include, PeercastStation)
      end

      def accessors_for(camels)
        snakes = camels.map(&method(:camel_to_snake))
        snakes.each do |snake|
          self.class_eval {
            attr_accessor snake.to_sym
          }
        end

        self.class_eval {
          define_method(:to_hash) do
            hash = {}
            snakes.each.with_index do |snake, index|
              hash[camels[index]] = instance_variable_get("@#{snake}")
            end
            hash
          end
        }
      end

      # APIオブジェクトクラスに all クラスメソッドを追加する
      def define_all_with(method_name)
        object_klass = self
        self.singleton_class.class_eval do
          define_method(:all) do
            __send__(method_name).map do |item|
              object_klass.new(item)
            end
          end

        end
      end

    end

    def mass_assign(hash)
      hash.each do |key,value|
        sym = ('@' + camel_to_snake(key)).to_sym
        instance_variable_set(sym, value)
      end
    end

   def initialize(hash)
      mass_assign(hash)
   end

  end

end
