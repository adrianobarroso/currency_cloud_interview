begin
  require "controller"
  require "view"
  require 'user_factory'
rescue LoadError
  class Controller; end
end

describe Controller do
  let(:user) { UserFactory.build('Adriano', 'CDA8772865C0CC3C') }
  let(:controller) { Controller.new(user) }

  describe '#initialize' do
    it 'stores the user in an instance variable' do
      user.authenticate
      expect(controller
        .instance_variable_get(:@user))
        .to be_a User
    end

    it 'stores the view in an instance variable' do
      user.authenticate
      expect(controller
        .instance_variable_get(:@view))
        .to be_a View
    end
  end

  describe '#list_recipients' do
    before do
      allow($stdout).to receive(:write)
    end
    it 'list recipients of a user to be an hash' do
      user.authenticate
      expect(controller
        .list_recipients)
        .to be_a Hash
    end
  end

  describe '#create_recipient' do
    before do
      allow($stdout).to receive(:write)
    end
    before(:all) do
      @new_recipient_name = "joe#{rand(1..99999)}"
    end

    it 'should controller respond to create_recipient' do
      expect(controller).to respond_to :create_recipient
    end

    it 'should create new recipient' do
      user.authenticate
      allow(STDIN).to receive(:gets) { @new_recipient_name }
      controller.create_recipient
    end

    it 'should have the new recipient on recipients list' do
      user.authenticate
      recipients = controller.list_recipients
      expect(recipients.to_s).to match @new_recipient_name
    end
  end
end
