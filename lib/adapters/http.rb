# frozen_string_literal: true

require 'json'
require 'httparty'

require './lib/exceptions/conflict'
require './lib/exceptions/external_request_fail'
require './lib/exceptions/four_oh_four'


module Adapters
  class Http
    class << self
      def post(logger, uri, options)
        http_request(:post, logger, uri, options)
      end

      def get(logger, uri, options)
        http_request(:get, logger, uri, options)
      end

      private

      def http_request(http_method, logger, uri, options)
        response = HTTParty.send(http_method, uri, options)

        process_response(http_method, response, logger)

        JSON.parse(response.body)
      end

      def process_response(method, response, logger)
        logger.info(
          message: "#{method} para: #{response.request.uri}",
          response: response
        )

        valid_response_code?(response)
      rescue HTTParty::Error, SocketError => e
        logger.error(message: e.message, response: response,
                     object: { action: 'REQUEST RESPONSE ERROR', error: e.class })
        raise Exceptions::ExternalRequestFail, e
      end

      def valid_response_code?(response)
        raise Exceptions::FourOhFour if response.code.eql?(404)
        raise Exceptions::Conflict if response.code.eql?(409)
        raise StandardError, "HTTP error: #{response.body}" unless response.success?
      end
    end
  end
end
