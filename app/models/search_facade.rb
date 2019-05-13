class SearchFacade

  def initialize(query)
    # binding.pry
    @query = query
  end

  def all_stations
    station_data.map do |station_data|
      Station.new(station_data)
    end
  end

  def closest_stations(limit)
    sorted = station_data.sort_by {
      |station| station[:distance]
    }
    closest = sorted.take(limit)
    closest.map do |station_data|
      Station.new(station_data)
    end

  end


end

private

def station_data
  response = conn.get
  data = JSON.parse(response.body, symbolize_names: true)[:fuel_stations]
end

def conn
  Faraday.new("https://developer.nrel.gov/api/alt-fuel-stations/v1/nearest") do |f|
  f.params["api_key"] = ENV["NREL_API_KEY"]
  f.params["location"] = @query
  f.params["fuel_type"] = "ELEC,LPG"
  f.params["access"] = "public"
  f.params["limit"] = 100
  f.params["format"] = "json"
  f.adapter Faraday.default_adapter
  end

end
# successful API Call
# https://developer.nrel.gov/api/alt-fuel-stations/v1/nearest?api_key=gdorVUbVrOWclFOuNkt2SmWPXkYbyFd9nCefRdzV&location=80206&fuel_type=ELEC,LPG&access=public&limit=100&format=json
