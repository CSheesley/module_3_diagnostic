class SearchFacade

  def initialize(query)
    # binding.pry
    @query = query
  end

  def all_stations
    response = conn.get
    data = JSON.parse(response.body, symbolize_names: true)[:fuel_stations]
    binding.pry
  end

  # def closest_stations
  # end

end

private

def conn
  Faraday.new("https://developer.nrel.gov/api/alt-fuel-stations/v1/nearest") do |f|
  f.params["api_key"] = ENV["NREL_API_KEY"]
  f.params["location"] = @query
  f.params["fuel_type"] = "ELEC,LPG"
  f.params["access"] = "public"
  f.params["format"] = "json"
  f.adapter Faraday.default_adapter
  end

end
# successful API Call
# https://developer.nrel.gov/api/alt-fuel-stations/v1/nearest?api_key=gdorVUbVrOWclFOuNkt2SmWPXkYbyFd9nCefRdzV&location=80206&fuel_type=ELEC,LPG&access=public&format=json
