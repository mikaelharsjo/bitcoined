class NewsController < UITableViewController
	def viewDidLoad
		@news = []
		self.refreshControl = UIRefreshControl.alloc.init
		self.tableView.delegate = self
		self.refreshControl.addTarget self, action: 'fetch_from_google_news', forControlEvents: UIControlEventValueChanged

		view.when_swiped do
			rate_view = RateController.alloc.init
			rate_view.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal
			self.presentViewController rate_view, animated: true, completion: nil
		end

		self.tableView.backgroundColor = UIColor.clearColor
		self.tableView.opaque = false
		tempImageView = UIImageView.alloc.initWithImage(UIImage.imageNamed "images/golden_gradient.jpg")
		tempImageView.setFrame self.tableView.frame 
		self.tableView.backgroundView = tempImageView
		tempImageView.release
	end

	def viewDidAppear(animated)
		fetch_from_google_news
	end

	def fetch_from_google_news
		self.refreshControl.beginRefreshing

		feed_parser = BW::RSSParser.new("https://news.google.com/news/feeds?q=bitcoin&output=rss")
		feed_parser.parse do |item|
			@news << item
			self.refreshControl.endRefreshing
			self.tableView.reloadData
		end
	end

	def tableView(tableView, cellForRowAtIndexPath: indexPath)
		@reuseIdentifier ||= "CELL_IDENTIFIER"

		cell = tableView.dequeueReusableCellWithIdentifier(@reuseIdentifier) || begin
			UITableViewCell.alloc.initWithStyle(UITableViewCellStyleDefault, reuseIdentifier:@reuseIdentifier)
		end

		cell.textLabel.text = @news[indexPath.row].title
		cell.textLabel.textColor = UIColor.whiteColor
		cell.backgroundColor = UIColor.clearColor
		cell
	end

	def tableView(tableView, numberOfRowsInSection: section)
		@news.count
	end

	def tableView(tableView, didSelectRowAtIndexPath:indexPath)
		tableView.deselectRowAtIndexPath(indexPath, animated: true)
		App.open_url @news[indexPath.row].link
	end

	def tableView(tableView, titleForHeaderInSection:section)
		'News about bitcoin'
	end
end