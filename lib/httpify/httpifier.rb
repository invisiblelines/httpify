module Httpify
  
  class Httpifier

    def initialize(url, options = {})
      @url     = url
      @options = options.symbolize_keys!
    end

    def perform!
      return @url if @url.blank?
      
      if !@url.match(/^http[s]?:\/\//)
        url = "http"
        url << "s" if @options[:https]
        url << "://#{@url}"
        url << "/" if @options[:trailing_slash]

        url
      else
        @url
      end
    end
    
  end

end