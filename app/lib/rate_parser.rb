class RateParser
	def self.create market
		p market
		if market == 'bitstamp'
			BitstampParser.new
		else
			MtGoxParser.new
		end
	end
end