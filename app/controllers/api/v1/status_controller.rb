# frozen_string_literal: true

module Api
  module V1
    class StatusController < ApplicationController
      def index
        render json: { message: 'Ok'}, status: 200
      end
    end
  end
end
