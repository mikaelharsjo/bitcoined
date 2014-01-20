class NewsController < UITableViewController
	def viewDidLoad
		@news = []
		self.refreshControl = UIRefreshControl.alloc.init
		self.tableView.delegate = self # extract class?
		self.refreshControl.addTarget self, action: 'fetch_from_google_news', forControlEvents: UIControlEventValueChanged
	end

	def viewDidAppear(animated)
		fetch_from_google_news
	end

	def fetch_from_google_news
		p 'fetch_from_google_news'
		self.refreshControl.beginRefreshing

		feed_parser = BW::RSSParser.new("https://news.google.com/news/feeds?q=bitcoin&output=rss")
		feed_parser.parse do |item|
		# called asynchronously as items get parsed
			p item.title
			self.refreshControl.endRefreshing
			@news << item
			self.tableView.reloadData
		end
	end

	def tableView(tableView, cellForRowAtIndexPath: indexPath)
		@reuseIdentifier ||= "CELL_IDENTIFIER"

		cell = tableView.dequeueReusableCellWithIdentifier(@reuseIdentifier) || begin
			UITableViewCell.alloc.initWithStyle(UITableViewCellStyleDefault, reuseIdentifier:@reuseIdentifier)
		end

		# put your data in the cell
		p @news[indexPath.row].inspect
		@news.each {|item| p item.title}

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
end