class AppDelegate
	def application(application, didFinishLaunchingWithOptions:launchOptions)
		BW::HTTP.get('http://data.mtgox.com/api/2/BTCUSD/money/ticker_fast') do |response|
			p response.body.to_str
		end
		true
	end
end
