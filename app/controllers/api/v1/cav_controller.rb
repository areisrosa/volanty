# frozen_string_literal: true

require './lib/use_cases/cav/transmit'
require './lib/use_cases/cav/cancel'

module Api
  module V1
    class CavesController < ApplicationController
      before_action :logging
      before_action :find_cav_by_cav_number, only: %i[show]
      def index
        @logging.info(message: "Searching cav for: #{params[:name]}")
      caves = Caves.where(cav_identifier: params[:name])
        render json: caves, each_serializer: CavesSerializer
      end

      def create
        @logging.info(message: "Transmiting cav for: #{params[:name]}")
        invoice = Cav.find_by!(visit_identifier: params[:name], cav_number: nil)
        UseCases::Cav::Transmit.execute(cav, provider, @logging)
        render json: Cav, serializer: CavesSerializer, status: :created
      end

       def show
        render json: @cav, serializer: CavesSerializer
      end

      private

      def find_cav_by_cav_number
        @logging.info(message: "Retrieving cav: #{params[:id]}")
        @invoice = Cav.find_by!(cav_number: params[:id])
      end

      def logging
        @logging ||= Logging.logger
      end
    end
  end
end
