module Moipr
  class InstrucaoUnica
    def initialize(xml)
      @xml = xml
    end

    def request
     # req = RestClient::Request.new(params)
     # req.basic_auth Moipr.configuration.secret_token, Moipr.configuration.secret_key
      RestClient::Request.execute(params)
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
	  :Authorization => 'Basic '+ Base64.encode64(:password.to_s +":"+ :user.to_s).chomp
        }
      }
    end
  end
end
