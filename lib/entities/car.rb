# frozen_string_literal: true

require 'dry-struct'
require './lib/entities/types'

module Entities
  class Car < Dry::Struct
    transform_keys(&:to_sym)

    attibute :brand, Entities::Types::String
    attribute :model, Entities::Types::String
    attribute :cav, Entities::Types::String
  end
end
