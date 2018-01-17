class Controller
  attr_reader :user
  def initialize(user)
    @user = user
    @view = View.new
    @headers = {
      :content_type => 'application/json',
      :authorization => "Bearer #{@user.token}"
    }
  end

  def list_recipients
    @view.request
    url = "https://coolpay.herokuapp.com/api/recipients"
    response = RestClient.get url, @headers
    @view.list_recipients(JSON.parse(response))
    JSON.parse(response)
  end

  def create_recipient
    values = {
      recipient: {
        name: @view.name_recipient
      }
    }
    @view.request
    RestClient.post 'https://coolpay.herokuapp.com/api/recipients', values, @headers
  end

  def list_payments
    @view.request
    response = RestClient.get 'https://coolpay.herokuapp.com/api/payments', @headers
    @view.list_payments(JSON.parse(response))
  end

  def send_payment
    @view.request
    recipients = list_recipients
    recipient = @view.choose_recipient(recipients)
    values = {
      "payment": {
        "amount": @view.amount_payment(recipient).to_f,
        "currency": "GBP",
        "recipient_id": recipient['id']
      }
    }
    @view.request
    RestClient.post 'https://coolpay.herokuapp.com/api/payments', values, @headers
  end
end
