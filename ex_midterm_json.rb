require 'json'
require 'rest_client'


class RegionalNewsPrinter
	attr_accessor 	:country

	def welcome
		puts "Welcome to the Regional News Printer."
		puts "Gathering headlines..."
	end

	def choose_country
		puts "What country do you want to see the headlines from?/n"
		country = gets.strip.to_s
		country
	end

	def parse_headlines
		country = choose_country
		url = "http://content.guardianapis.com/search?q=#{country}:&api-key=test"
		data = RestClient.get(url)
		parsed_headlines = JSON.parse(data)

		puts "Right, we're ready to go."

		lines = []
		parsed_headlines['results']['webTitle'][0..5].each do |line|
#			line_hash={}
			line_hash[:title] = line['results']['webTitle'].strip
#			lines << line_hash
		end
		lines
	end

	def puts_headlines
		puts "Here are the top 5 headlines for #{country}:"
		lines.each do
			puts "#{line_hash[title]}:"
		end
	end
end

#news = RegionalNewsPrinter.new ("wales", url )


### runner

news = RegionalNewsPrinter.new

news.welcome
#news.choose_country
#news.get_headlines
#news.new_url
news.parse_headlines
#news.compile_headlines
news.puts_headlines






