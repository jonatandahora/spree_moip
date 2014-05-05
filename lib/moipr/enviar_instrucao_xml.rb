module Moipr
  class EnviarInstrucaoXML
    def initialize(params = {})
      @order = params[:order]
    end

    def build
      xml = ::Builder::XmlMarkup.new(target: '')
      xml.EnviarInstrucao do |ei|
        ei.InstrucaoUnica('TipoValidacao' => 'Transparente') do |instrucao_unica|
          instrucao_unica.Razao "Loja Fitnoss" # V256
          instrucao_unica.IdProprio @order.number # V64
          instrucao_unica.Valores { |v| v.Valor(@order.total, 'moeda' => 'BRL') }# decimal(9,2)
          instrucao_unica.Pagador do |p|
            p.Nome "#{@order.bill_address.firstname} #{@order.bill_address.lastname}" # 256
            p.Email @order.user.email # 45
            p.IdPagador @order.user.id # 20
            p.EnderecoCobranca do |e|
              e.Logradouro @order.bill_address.address1 # 45
              e.Numero 5
              e.Complemento @order.bill_address.address2 # Opcional 45
              e.Bairro 'Anchieta'
              e.Cidade @order.bill_address.city # 32
              e.Estado 'SP'
              e.Pais "BRA" # 3
              e.CEP  '09601-000'
              e.TelefoneFixo '(11)1234-0000'
            end
          end
        end
      end
    end
  end
end
