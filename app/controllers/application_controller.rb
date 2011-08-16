class ApplicationController < ActionController::Base
  protect_from_forgery

  require 'json'  
  require 'open-uri'    
  
  def data
  

    if params[:lat].blank? || params[:lng].blank?
      params[:lat] = 30.26
      params[:lng] = -97.73
    end
    
    
    radius = 10000
    
    #url = 'http://planetof.infochimps.com/encyclopedic/dbpedia/articles/search_nearby?g.latitude=30.26&g.longitude=-97.73&g.radius=10000'
    #url = 'http://planetof.infochimps.com/encyclopedic/dbpedia/articles/search_nearby?g.latitude=' + lat + '&g.longitude=-97.73&g.radius=10000'
    
    url = 'http://planetof.infochimps.com/encyclopedic/dbpedia/articles/search_nearby?' +
      '&g.latitude=' + params[:lat].to_s + 
      '&g.longitude=' + params[:lng].to_s +
      '&g.radius=' + radius.to_s +
      '&f.q=museum'
      
      #for foursquare
      #&f.category = "movie theater"
      
    # puts url
    
    buffer = open(url).read

    @result = JSON.parse(buffer)   
    
    render :json => @result
  end
  
  
end
