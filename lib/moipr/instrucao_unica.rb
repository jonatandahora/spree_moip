module Moipr
  class InstrucaoUnica
    def initialize(xml)
      @xml = xml
    end

    def request
      RestClient::Request.execute(params)
    end

    private
    user = Moipr.configuration.secret_key.to_s
    Moipr.configuration.secret_key.to_s== nil?puts "NULOPORRA":"AEHHHHHHHH"
    password = Moipr.configuration.secret_token.to_s
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
