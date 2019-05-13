class SearchController < ApplicationController

  def index
    # binding.pry
    # params "q"=>"80206"
    render locals: {
      facade: SearchFacade.new(params[:q])
    }
  end

end
