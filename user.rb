class User
  attr_reader :token
  def initialize(username, apikey)
    @username = username
    @apikey = apikey
    @token = nil
  end

  def authenticate
    values = {
      username: @username,
      apikey: @apikey
    }

    headers = {
      :content_type => 'application/json'
    }
    response = RestClient.post('https://coolpay.herokuapp.com/api/login', values, headers){|response, request, result| response }

    @token = JSON.parse(response)['token'] unless response.code == 404
  end

  def logged?
    self.token ? true : false
  end
end
