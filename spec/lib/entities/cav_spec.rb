# frozen_string_literal: true

require 'spec_helper'
require './lib/entities/cav'

describe Entities::Cav do
  subject(:cav) do
    described_class.new(
      name: name
    )
  end

  describe 'initialies product' do
    context 'with valid name' do
      let(:name) { 'Uno Mil' }

      it 'initialies with name' do
        expect(cav.name).to eq(name)
      end
    end

    context "When adding two numbers" do
      let(:name) { 3234 }

      it 'raises exception' do
        expect { cav }.to raise_error(Dry::Struct::Error)
      end
    end
  end
end
