require 'base64'
module Moipr
  class InstrucaoUnica
    
    def initialize(xml)
      @xml = xml
      
    end

    def request
      req = RestClient::Request.new
      req.basic_auth(Moipr.configuration.secret_token, Moipr.configuration.secret_key)
      req.execute(params)
    end
    private
    def params
      {
        :method => :post,
        :url => Moipr.configuration.url,
        :payload => @xml.build,
        :headers => {
          :content_type => :xml,
          :accept => :xml
        }
      }
    end
  end
end
