require 'base64'
module Moipr
  class InstrucaoUnica
    def initialize(xml)
      @xml = xml
      @auth = 'Basic ' + Base64.encode64( Moipr.configuration.secret_token + ":" + Moipr.configuration.secret_key ).chomp
    end

    def request
      RestClient::Request.execute(params)
    end
    
    
    
    private
    def params
      {
        :method => :post,
        :url => Moipr.configuration.url,
        :payload => @xml.build,
        :headers => {
          :content_type => :xml,
          :accept => :xml,
	  :Authorization => @auth
        }
      }
    end
  end
end
