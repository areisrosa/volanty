# frozen_string_literal: true

require './lib/exceptions/provider_not_found'
require './lib/entities/cav'

module UseCase
  module Cav
    class Visit
      attr_reader :brand, :model, :cav, :logger

      def self.execute(brand, model, cav, logger)
        new(brand, model, cav, logger).execute
      end

      def initialize(brand, model, cav, logger)
        @brand = brand
        @model = model
        @cav = cav
        @logger = logger
      end

      def execute
        return log_not_found if purchase.nil?

        cav = find_cav

        cav.update!(
          name: entity_cav.name
        )
      end

      private

        def find_cav
          cav_repo.find_or_create_by(
            name: entity_cav.name
          )
        end

        def entity_cav
          @entity_cav ||=Entities::Cav.new(
            name: name
          )
        end
    end
  end
end
