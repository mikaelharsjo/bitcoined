class AppDelegate
	def application(application, didFinishLaunchingWithOptions:launchOptions)
		#BW::HTTP.get('http://data.mtgox.com/api/2/BTCUSD/money/ticker_fast') do |response|
		#	p response.body.to_str
		#end
		# UIScreen describes the display our app is running on

		@window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
		@window.makeKeyAndVisible
		@window.rootViewController = BitcoinController.alloc.initWithNibName(nil, bundle: nil)

		true
	end
end
