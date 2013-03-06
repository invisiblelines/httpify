require 'active_support/core_ext/hash'
require 'httpify/version'
require 'httpify/httpifier'
require 'httpify/core_ext/string/httpify'

# = Overview:
# A small extension to ensure any variable that should return a url
# includes the correct http prefix
# ---
# = Usage:
#   require 'httpify'
# 
#   class Link
#     include Httpify
#     httpify :url
#   end
#

module Httpify
  
  extend ActiveSupport::Concern
  
  module ClassMethods
    
    # Formats the variable
    # <tt>:args</tt>:: The names of the variables to httpify
    #
    # Optional parameters passed in as a hash
    # <tt>:https</tt>:: Boolean - adds https
    # <tt>:trailing_slash</tt>:: Boolean - adds a trailing slash
    #
    def httpify(*args)
      options = args.extract_options!

      args.each do |arg|
        define_method arg.to_sym do
          str = instance_variable_get("@#{arg}")
          str.httpify(options) unless !str.is_a?(String)
        end
      end
    end
    
  end

end