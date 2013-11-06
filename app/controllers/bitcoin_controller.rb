class BitcoinController < UIViewController
	def initWithValue value
		@value = value
		init
	end

	def viewDidLoad
		super

		self.view.backgroundColor = UIColor.colorWithPatternImage(UIImage.imageNamed('images/golden_gradient.jpg'))

		@label = UILabel.alloc.initWithFrame(CGRectZero)
		@label.text = @value
		@label.color = UIColor.whiteColor
		@label.setFont(UIFont.systemFontOfSize(60))
		@label.sizeToFit
		@label.center = CGPointMake(self.view.frame.size.width / 2, self.view.frame.size.height / 2 - 50)
		self.view.addSubview @label
	end
end