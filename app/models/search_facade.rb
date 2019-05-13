class SearchFacade

  def initialize(query)
    # binding.pry
    @query = query
  end

  def all_stations
  # API CALL
  end

  # def closest_stations
  # end

end

private

def conn
  Faraday.new("https://developer.nrel.gov/api/alt-fuel-stations/v1/nearest") do |f|


  end



end
# successful API Call
# https://developer.nrel.gov/api/alt-fuel-stations/v1/nearest?api_key=gdorVUbVrOWclFOuNkt2SmWPXkYbyFd9nCefRdzV&location=80206&format=json
