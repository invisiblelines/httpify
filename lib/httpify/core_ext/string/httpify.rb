require 'httpify/httpifier'

class String
  
  def httpify(options = {})
    Httpify::Httpifier.new(self, options).perform!
  end
end