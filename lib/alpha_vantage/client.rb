require 'uri'
require 'net/http'

module AlphaVantage
  class Client
    ENDPOINT = 'https://www.alphavantage.co/'.freeze

    def initialize(api_key:)
      @api_key = api_key
    end

    def stock(symbol)
      uri = URI(ENDPOINT)
      params = {
        function: 'TIME_SERIES_INTRADAY',
        symbol: 'MSFT',
        interval: '1min',
        api_key: @api_key
      }
      uri.query = URI.encode_www_form(params)
      res = Net::HTTP.get_response(uri)
    end
  end
end
