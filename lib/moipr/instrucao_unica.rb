module Moipr
  class InstrucaoUnica
    def initialize(xml)
      @xml = xml
    end

    def request
    user = "MPPK25WMATRLIABUJO0UQIMSBPZGQQURVSYPTFII"
    password = "MWVXU9OTHMEYNR0VXGT2L0GDQRMLMBPH"
      RestClient::Request.execute(params(user, password))
    end

    private
    
    def params(user, password)
      {
        :method => :post,
        :url => Moipr.configuration.url,
        :payload => @xml.build,
        :user => Moipr.configuration.secret_key,
        :password => Moipr.configuration.secret_token,
        :headers => {
          :content_type => :xml,
          :accept => :xml,
	  :Authorization => 'Basic '+ Base64.encode64(user + ':' + password).chomp
        }
      }
    end
  end
end
