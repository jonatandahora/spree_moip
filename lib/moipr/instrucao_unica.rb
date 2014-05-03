module Moipr
  class InstrucaoUnica
    def initialize(xml)
      @xml = xml
    end

    def request
     # req = RestClient::Request.new(params)
     # req.basic_auth Moipr.configuration.secret_token, Moipr.configuration.secret_key
      req.execute(params)
    end

    private
    def params
      {
        :method => :post,
        :url => Moipr.configuration.url,
        :payload => @xml.build,
        :user => Moipr.configuration.secret_key,
        :password => Moipr.configuration.secret_token,
        :headers => {
          :content_type => :xml,
          :accept => :xml,
	  :Authorization => Base64.encode64(:password +":"+ :user)
        }
      }
    end
  end
end
