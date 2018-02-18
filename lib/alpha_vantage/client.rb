module AlphaVantage
  class Client
    def initialize(api_key:)
      @api_key = api_key
    end

    def stock(symbol); end
  end
end
