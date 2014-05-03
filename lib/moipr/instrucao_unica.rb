module Moipr
  class InstrucaoUnica
    def initialize(xml)
      @xml = xml
    end

    def request
      RestClient::Request.execute(params)
    end

    private
    user = "MPPK25WMATRLIABUJO0UQIMSBPZGQQURVSYPTFII"
    password = "MWVXU9OTHMEYNR0VXGT2L0GDQRMLMBPH"
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
	  :Authorization => 'Basic '+ Base64.encode64(password + ':' + user).chomp
        }
      }
    end
  end
end
