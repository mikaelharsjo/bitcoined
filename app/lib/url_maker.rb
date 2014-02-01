class UrlMaker
	def initialize(market, currency)
		@market = market
		@currency = currency

		@urls = {
			mtgox: 'http://data.mtgox.com/api/2/BTCUSD/money/ticker_fast',
			bitstamp: 'https://www.bitstamp.net/api/ticker'
		}
	end

	def url
		@market = @market || 'mtgox'
		p @urls
		@urls[@market.to_sym]
	end
end