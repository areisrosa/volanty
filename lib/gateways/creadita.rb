# frozen_string_literal: true

require './lib/exceptions/http_exception'
require './lib/adapters/http'

module Gateways
  class Credita
    attr_reader :id, :logger

    def self.buyer(id, logger)
      new(id, logger).buyer
    end

    def initialize(id, logger)
      @id = id
      @logger = logger
    end

    def buyer
      url = "#{ENV['CREDITA_API_URL']}/v2/data/#{id}/cav"
      response = get(url)

      { buyer_type: response['data_type'], identifier: response['name'] }
    end

    private

    def get(url)
      Adapters::Http.get(logger, url, headers: headers)
    end

    def url
      "#{ENV['CREDITA_API_URL']}/#{id}"
    end

    def headers
      {
        'Gn-ApiKey' => ENV['CREDITA_AUTH_TOKEN'],
        'Accept' => 'application/json',
      }
    end
  end
end
