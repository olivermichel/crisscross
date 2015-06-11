module Crisscross
  ##
  # adds a simple KV-style attributes to edges or vertices
  module Attributes
    def attributes
      @attributes ||= {}
    end

    def set_attribute(key, value)
      @attributes ||= {}
      @attributes[key] = value
    end

    def get_attribute(key)
      if @attributes.key?(key)
        @attributes[key]
      else
        fail 'attribute with specified key is not set'
      end
    end

    def [](key)
      get_attribute(key)
    end

    def []=(key, value)
      set_attribute(key, value)
    end
  end
end
