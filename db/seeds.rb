
require 'byebug'
require 'uri'
require 'net/http'
require 'openssl'
require 'json'
url = URI("https://free-nba.p.rapidapi.com/games?page=0&per_page=25")

http = Net::HTTP.new(url.host, url.port)
http.use_ssl = true
http.verify_mode = OpenSSL::SSL::VERIFY_NONE

request = Net::HTTP::Get.new(url)
request["x-rapidapi-host"] = 'free-nba.p.rapidapi.com'
request["x-rapidapi-key"] = 'c38ba6a2c0msh5f61bfe076d3a6ep195b44jsn034cfbf202fc'

response = http.request(request)

data = response.read_body
parsed_data = JSON.parse(data)
teams_arr = parsed_data["data"]
teams_arr.each do |team|

  Team.create(name: team['home_team']['full_name'], abbreviation: team['home_team']['abbreviation'], conference:team['home_team']['conference'], division:team['home_team']['division'], city:team['home_team']['city'])


end
