require 'rspec'
require_relative '../app/lib/url_maker'

describe UrlMaker do
	it 'exists' do
		expect(UrlMaker).not_to be_nil
	end

	describe '#url' do
		it 'returns MtGox USD by default' do
			url_maker = UrlMaker.new nil, nil
			expect(url_maker.url).to eql 'http://data.mtgox.com/api/2/BTCUSD/money/ticker_fast'
		end

		it 'returns bitstamp if selected' do
			url_maker = UrlMaker.new 'bitstamp', nil
			expect(url_maker.url).to eql 'https://www.bitstamp.net/api/ticker'
		end
	end
end