# frozen_string_literal: true

require './lib/exceptions/get_cav/exceptions'

module UseCases
  class Car
    attr_reader :id, :brand, :model, :cav

    def self.get(id, brand, model, cav)
      new(id, brand, model, cav)
    end

    def initialize(id, brand, model, cav)
      @id = id
      @brand = brand
      @model = model
      @cav = cav
    end

    def get
      provider.get(id)
    rescue Exception => e
      logger.error('Failed to send invoice: #{e.message}')
    end
  end
end
