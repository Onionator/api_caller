class DestinationsController < ApplicationController

def index
  pizza = nil
  login = RestClient::Request.new({
    method: :post,
    url: 'localhost:3000/auth/login?email=sam@sam.sam&password=123456'
  }).execute do |soon_to_be_a_token, request, result|
      case soon_to_be_a_token.code
      when 400
        [ :error, JSON.parse(soon_to_be_a_token.to_str) ]
      when 200
        [ :success, JSON.parse(soon_to_be_a_token.to_str) ]
        puts request.headers
      else
        fail "Invalid soon_to_be_a_token #{soon_to_be_a_token.to_str} received."
      end
      pizza = soon_to_be_a_token
    end

    token = JSON.parse(pizza)

  response = RestClient::Request.execute(
    method: :get,
    url: 'localhost:3000/destinations/',
    headers: { Authorization: token["token"] }
  )

@destinations = JSON.parse(response)


 end


end
