require 'spec_helper'

module AlphaVantage
  RSpec.describe Client do
    describe 'default behaviour' do
      it 'raises an ArgumentError on missing api_key' do
        expect { Client.new }.to raise_error(ArgumentError)
      end
    end

    describe '.stock' do
      describe 'default behaviour' do
        it 'retrieves the intraday time-series data for the given symbol' do
          client = AlphaVantage::Client.new(api_key: 'random_api_key')

          stock_date = client.stock('MSFT')

          expect(
            a_request(:get, 'https://www.alphavantage.co/').
            with(query: {
            function: 'TIME_SERIES_INTRADAY',
            symbol: 'MSFT',
            interval: '1min',
            api_key: 'random_api_key'
          })).to have_been_made.once
        end
      end
    end
  end
end
