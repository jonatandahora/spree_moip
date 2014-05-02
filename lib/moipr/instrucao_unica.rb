module Moipr
  class InstrucaoUnica
    def initialize(xml)
      @xml = xml
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
        :user => 'jonatandahora@outlook.com',
        :password => 'jonatan1234',
        :headers => {
          :content_type => :xml,
          :accept => :xml
        }
      }
    end
  end
end
