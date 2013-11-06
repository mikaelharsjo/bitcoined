class BitcoinController < UIViewController
	def viewDidLoad
		super

		# self.view.backgroundColor = UIColor.whiteColor
		self.view.backgroundColor = UIColor.colorWithPatternImage(UIImage.imageNamed('images/golden_gradient.jpg'))

		@label = UILabel.alloc.initWithFrame(CGRectZero)
		@label.text = '$262.40002'
		@label.color = UIColor.whiteColor
		@label.setFont(UIFont.systemFontOfSize(45))
		@label.sizeToFit
		@label.center = CGPointMake(self.view.frame.size.width / 2, self.view.frame.size.height / 2 - 50)
		self.view.addSubview @label
	end
end