class RateController < UIViewController
	def viewDidLoad
		super

		url_maker = UrlMaker.new NSUserDefaults.standardUserDefaults["exchange_market"], nil

		BW::HTTP.get(url_maker.url) do |response|
			json = BW::JSON.parse(response.body.to_str)
			value = json['data']['last_local']['display_short']
			@label.text = value
		end

		view.backgroundColor = UIColor.colorWithPatternImage(UIImage.imageNamed('images/golden_gradient.jpg'))

		@label = UILabel.alloc.initWithFrame(CGRectZero)
		@label.color = UIColor.whiteColor
		@label.setFont(UIFont.fontWithName('HelveticaNeue-UltraLight', size: 74))
		@label.sizeToFit
		view.addSubview @label

		Motion::Layout.new do |layout|
			layout.view view
			layout.subviews "label" => @label
			layout.metrics "top" => 200, "margin" => 30
			layout.vertical "|-top-[label]"
			layout.horizontal "|-margin-[label]"
		end

		view.when_swiped do
			p 'swiped'
			news_view = NewsController.alloc.init
			news_view.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal
			self.presentViewController news_view, animated:true, completion:nil
		end
	end

	def willAnimateRotationToInterfaceOrientation(orientation, duration: duration)
		view.constraints.each { |constraint| view.removeConstraint constraint }
		Motion::Layout.new do |layout|
			layout.view view
			layout.subviews "label" => @label
			layout.metrics "top" => 110, "margin" => 100
			layout.vertical "|-top-[label]"
			layout.horizontal "|-margin-[label]"
		end
	end
end