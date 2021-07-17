# frozen_string_literal: true

require 'dry-struct'
require './lib/entities/types'

module Entities
  class Calendar < Dry::Struct
    transform_keys(&:to_sym)

    attribute :date, Entities::Types::JSON::Date
  end
end
