class ForcastsController < ApplicationController

  def index
    weather = Unirest.get("https://query.yahooapis.com/v1/public/yql?q=select%20*%20from%20weather.forecast%20where%20woeid%20in%20(select%20woeid%20from%20geo.places(1)%20where%20text%3D%22newyork%2C%20ny%22)&format=json&env=store%3A%2F%2Fdatatables.org%2Falltableswithkeys").body
    # binding.pry
    @current_weather = weather["query"]["results"]["channel"]["item"]["condition"]
    @fiveday_forecast = weather["query"]["results"]["channel"]["item"]["forecast"]
    @nameofplace = weather["query"]["results"]["channel"]["item"]["title"]
    render "index.html.erb"
  end

  def search
    city = params[:city]
    state = params[:state]
    weather = Unirest.get("https://query.yahooapis.com/v1/public/yql?q=select%20*%20from%20weather.forecast%20where%20woeid%20in%20(select%20woeid%20from%20geo.places(1)%20where%20text%3D%22#{city}%2C%20#{state}%22)&format=json&env=store%3A%2F%2Fdatatables.org%2Falltableswithkeys").body
    @current_weather = weather["query"]["results"]["channel"]["item"]["condition"]
    @fiveday_forecast = weather["query"]["results"]["channel"]["item"]["forecast"]
    @nameofplace = weather["query"]["results"]["channel"]["item"]["title"]
    render "index.html.erb"
  end

end
