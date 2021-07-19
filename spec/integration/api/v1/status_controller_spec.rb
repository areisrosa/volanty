# frozen_string_literal: true

require 'swagger_helper'

describe 'StatusController' do
  path '/api/v1/status' do
    get 'return ok' do
      tags 'Healthcheck'
      description 'Endpoint for health check'
      consumes 'application/json'

      response '200', 'status ok' do
        run_test!
      end
    end
  end
end
