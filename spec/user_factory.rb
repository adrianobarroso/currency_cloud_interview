begin
  require 'user'
rescue LoadError
  class User; end
end

class UserFactory
  def self.build(name, apikey)
    if User.allocate.method(:initialize).arity == 2
      User.new(name, apikey)
    else
      attributes = {
        name: name,
        apikey: apikey
      }
      User.new(attributes)
    end
  end
end
