# frozen_string_literal: true

require './lib/exceptions/get_cav/exceptions'

module UseCases
  class Calendar
    attr_reader :id, :date

    def self.get(id, date)
      new(id, date)
    end

    def initialize(id, date)
      @id = id
      @date = date
    end

    def get
      provider.get(id)
    rescue Exception => e
      logger.error('Failed to send invoice: #{e.message}')
    end
  end
end
