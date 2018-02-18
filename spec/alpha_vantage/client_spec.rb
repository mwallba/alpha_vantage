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

          stub_request(:get, "https://www.alphavantage.co/?api_key=random_api_key&function=TIME_SERIES_INTRADAY&interval=1min&symbol=MSFT").
            with(  headers: {
            'Accept'=>'*/*',
            'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
            'Host'=>'www.alphavantage.co',
            'User-Agent'=>'Ruby'
          }).
          to_return(status: 200, body: "", headers: {})

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
