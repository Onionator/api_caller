class DestinationsController < ApplicationController

def index
  response = RestClient::Request.execute(
method: :get,
url: 'localhost:3001/destinations/',
headers: { Authorization: 'eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoyLCJleHAiOjE1NjY0OTkxNDZ9.83cv5YMl7QFc6bG_caQ2xVfVs1xr4yERMQfT-sKE6_w' }
)
@destinations = JSON.parse(response)
 end


end
