class Controller
  def initialize(user)
    @user = user
    @view = View.new
  end

  def list_recipients
    headers = {
      :content_type => 'application/json',
      :authorization => "Bearer #{@user.token}"
    }
    name = @view.list_or_seach_recipient
    suffix = name.empty? ? '' : "?name=#{name}"
    url = "https://coolpay.herokuapp.com/api/recipients" + suffix
    response = RestClient.get url, headers
    @view.list_recipients(JSON.parse(response))
  end

  def create_recipient
    values = {
      recipient: {
        name: @view.name_recipient
      }
    }
    headers = {
      :content_type => 'application/json',
      :authorization => "Bearer #{@user.token}"
    }
    RestClient.post 'https://coolpay.herokuapp.com/api/recipients', values, headers
  end
end
