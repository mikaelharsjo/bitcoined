class AppDelegate
	def application(application, didFinishLaunchingWithOptions:launchOptions)
	end

	def applicationDidBecomeActive(application)
		@window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
		@window.makeKeyAndVisible
		@window.rootViewController = RateController.alloc.init

		true
	end
end
