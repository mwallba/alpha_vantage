require 'spec_helper'

module AlphaVantage
  RSpec.describe Client do
    describe 'default behaviour' do
      it 'raises an ArgumentError on missing api_key' do
        expect { Client.new }.to raise_error(ArgumentError)
      end
    end
  end
end
