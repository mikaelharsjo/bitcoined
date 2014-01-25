class NewsController < UITableViewController
	def viewDidLoad
		@news = []
		self.refreshControl = UIRefreshControl.alloc.init
		self.tableView.delegate = self
		self.refreshControl.addTarget self, action: 'fetch_from_google_news', forControlEvents: UIControlEventValueChanged

		view.when_swiped do
			news_view = BitcoinController.alloc.init
			self.presentViewController news_view, animated:true, completion:nil
		end
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
		'Bitcoin news'
	end
end