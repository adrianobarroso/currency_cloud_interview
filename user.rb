require 'rest_client'
require 'JSON'

class User
  attr_reader :token, :name, :apikey
  def initialize(name, apikey)
    @name = name
    @apikey = apikey
    @token = nil
  end

  def authenticate
    values = {
      username: @name,
      apikey: @apikey
    }

    headers = {
      :content_type => 'application/json'
    }
    url = 'https://coolpay.herokuapp.com/api/login'
    response = RestClient.post(url, values, headers) { |response, request, result| response }

    @token = JSON.parse(response)['token'] unless response.code == 404
  end

  def logged?
    self.token ? true : false
  end
end
