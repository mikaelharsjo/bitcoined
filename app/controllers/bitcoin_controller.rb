class BitcoinController < UIViewController
	def initWithValue value
		@value = value
		init
	end

	def viewDidLoad
		super

		view.backgroundColor = UIColor.colorWithPatternImage(UIImage.imageNamed('images/golden_gradient.jpg'))

		@label = UILabel.alloc.initWithFrame(CGRectZero)
		@label.text = @value
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