class AppDelegate
	def application(application, didFinishLaunchingWithOptions:launchOptions)
		BW::HTTP.get('http://data.mtgox.com/api/2/BTCUSD/money/ticker_fast') do |response|
			json = BW::JSON.parse(response.body.to_str)
			value = json['data']['last_local']['display_short']

			@window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
			@window.makeKeyAndVisible
			@window.rootViewController = BitcoinController.alloc.initWithValue value
		end

		true
	end
end
