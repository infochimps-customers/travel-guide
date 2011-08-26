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
    
    
    if params[:source] == "foursquare"
      url = 'http://api.infochimps.com/geo/location/foursquare/poi_info/search?'    
    else
      url = 'http://api.infochimps.com/encyclopedic/dbpedia/articles/search?'
    end
    
    #url = 'http://apistag.infochimps.com/encyclopedic/dbpedia/articles/search_nearby?' +
    #url = 'http://planetof.infochimps.com/geo/location/foursquare/poi_info/search_nearby?' +    
    
    url +=
      '&g.latitude=' + params[:lat].to_s + 
      '&g.longitude=' + params[:lng].to_s +
      '&g.radius=' + radius.to_s
    if !params[:query].blank?  
     url += '&f.q=' + params[:query].to_s
    end

url += '&apikey=flip69'


      #'&f.q=museum'

      
      #for foursquare
      #&f.category = "movie theater"
      
    puts url
    
    buffer = open(url).read

    @result = JSON.parse(buffer)   
    
    render :json => @result
  end
  
  
  def weather
    if params[:start].blank? || params[:end].blank?
      params[:start] = 8
      params[:end] = 8
    end  
  end
  
  
end
