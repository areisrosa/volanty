# frozen_string_literal: true

require 'dry-struct'
require './lib/entities/types'

module Entities
  class Cav < Dry::Struct
    transform_keys(&:to_sym)

    attribute :name, Entities::Types::String
  end
end
