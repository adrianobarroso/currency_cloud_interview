begin
  require 'user_factory'
rescue
end

describe User do
  let(:user) { UserFactory.build("", "") }

  describe '#name' do
    it 'should return the name of the user' do
      expect(user).to respond_to :name
    end
  end

  describe '#apikey' do
    it 'should return the apikey of user' do
      expect(user).to respond_to :apikey
    end
  end

  describe '#token' do
    it 'should return the token of user' do
      expect(user).to respond_to :token
    end
  end

  describe '#initialize' do
    it 'should create an user with its attributes' do
      user = UserFactory.build('Adriano', 'CDA8772865C0CC3C')
      expect(user.name).to eq 'Adriano'
      expect(user.apikey).to eq 'CDA8772865C0CC3C'
    end
  end

  describe '#get_token' do
    it 'should login the user with the CoolAPI' do
      user = UserFactory.build('Adriano', 'CDA8772865C0CC3C')
      user.authenticate
      expect(user.logged?).to eq true
    end
  end
end
