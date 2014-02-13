class MtGoxParser
	def parse(json)
		value = json['data']['last_local']['value']
		sprintf('%.2f', value)
	end
end