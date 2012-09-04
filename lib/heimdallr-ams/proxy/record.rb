module Heimdallr
  class Proxy::Record

    delegate :active_model_serializer, :to => :@record

    def read_attribute_for_serialization(name)
      @record.send name
    end

  end
end