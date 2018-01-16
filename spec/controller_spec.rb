begin
  require_relative "../controller"
  require_relative "../view"
  require 'user_factory'
rescue LoadError
  class Controller; end
end

describe Controller do
  @user = UserFactory.build('Adriano', 'CDA8772865C0CC3C')
  @user.authenticate

  @controller = Controller.new(@user)

  describe '#initialize' do
    it 'stores the Cookbook in an instance variable' do
      expect(@controller
        .instance_variable_get(@user))
        .to be_a User
    end
  end

  # describe '#list' do
  #   it 'should implements a method to list cookbook recipes' do
  #     expect(controller).to respond_to :list
  #   end
  # end
  #
  # describe '#create' do
  #   it 'should implements a method to create a cookbook recipe' do
  #     expect(controller).to respond_to :create
  #   end
  # end
  #
  # describe '#destroy' do
  #   it 'should implements a method to destroy a cookbook recipe' do
  #     expect(controller).to respond_to :destroy
  #   end
  # end
end
