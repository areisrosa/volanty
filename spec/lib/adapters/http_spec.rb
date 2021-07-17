# frozen_string_literal: true

require './lib/adapters/http'
require './lib/exceptions/conflict'
require './lib/exceptions/external_request_fail'
require './lib/exceptions/four_oh_four'

describe Adapters::Http do
  let(:url) { 'https://https://bitbucket.org/volantyApp/assessment/src/master/backend/data/cav.json' }
  let(:logger) { Logger.new('/dev/null') }
  let(:options) { { headers: { 'Accept' => 'application/json' } } }

  describe '#post' do
    context "with success" do
      before do
        stub_request(:post, url).with do |request|
          request.headers = {
            'Accept' => 'application/json',
          }
        end.to_return(body: {}.to_json)
      end

      it 'save a key value' do
        expect(described_class.post(logger, url, options)).to be_empty
      end
    end
  end
end
