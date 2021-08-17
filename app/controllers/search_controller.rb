class SearchController < ApplicationController
  def search
    @value = params["search"]["value"]
    @dates = search_for(@value)
  end
  
private
  def search_for(value)
    
  end
end
