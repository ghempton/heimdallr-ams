module Heimdallr
  module Serializer

    def initialize(object, options={})
      if current_user = options[:scope]
        object = object.restrict(current_user)
      end
      super(object, options)
    end

    def attributes
      hash = super

      # Heimdallr will automatically restrict attributes, so no need
      # to require them to be defined in the serializer
      object.attributes.each do |name, value|
        next if _attributes.has_key?(name)
        hash[name] = value
      end

      hash
    end

  end
end