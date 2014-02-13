require 'rspec'
require 'json'
require_relative '../app/lib/rate_parser.rb'
require_relative '../app/lib/mtgox_parser.rb'
require_relative '../app/lib/bitstamp_parser.rb'

describe RateParser do
	it 'exists' do
		expect(RateParser).not_to be_nil
	end
end

describe MtGoxParser do
	it 'exists' do
		expect(MtGoxParser).not_to be_nil
	end

	let(:parser) { MtGoxParser.new }

	context '#parse' do
		it 'has a parse method' do
			parser.should respond_to :parse
		end

		it 'parses a rate from json' do
			json = '{"result": "success", "data": {"last_local": {"value": "480.00000", "value_int": "48000000", "display": "$480.00", "display_short": "$480.00", "currency": "USD"}, "last": {"value": "480.00000", "value_int": "48000000", "display": "$480.00", "display_short": "$480.00", "currency": "USD"}, "last_orig": {"value": "480.00000", "value_int": "48000000", "display": "$480.00", "display_short": "$480.00", "currency": "USD"}, "last_all": {"value": "480.00000", "value_int": "48000000", "display": "$480.00", "display_short": "$480.00", "currency": "USD"}, "buy": {"value": "478.05400", "value_int": "47805400", "display": "$478.05", "display_short": "$478.05", "currency": "USD"}, "sell": {"value": "480.00000", "value_int": "48000000", "display": "$480.00", "display_short": "$480.00", "currency": "USD"}, "now": "1392318124431494"} }'
			rate = parser.parse JSON.parse(json)
			expect(rate).to eql '480.00'
		end
	end
end

describe BitstampParser do
	it 'exists' do
		expect(BitstampParser).not_to be_nil
	end

	let(:parser) { BitstampParser.new }

	it 'has a parse method' do
		parser.should respond_to :parse
	end

		it 'parses a rate from json' do
			json = '{"high": "667.00", "last": "631.25", "timestamp": "1392318809", "bid": "631.25", "volume": "16665.39496310", "low": "631.00", "ask": "631.30"}'
			rate = parser.parse JSON.parse(json)
			expect(rate).to eql '631.25'
		end
		
end