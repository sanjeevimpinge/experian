require 'savon'

module Experian
  class Client

    attr_accessor :user_id, :group_id, :group_name, :subscriber_id, :request_type , :environment
    attr_reader :wsdl

    def initialize(args = {})
      #args.to_symbols_and_strings!
      @user_id =  args[:user_id] || ENV['EXPERIAN_USER_ID']
      @group_id =  args[:group_id] || ENV['EXPERIAN_GROUP_ID']
      @group_name =  args[:group_name] || ENV['EXPERIAN_GROUP_NAME']
      @subscriber_id =  args[:subscriber_id] || ENV['EXPERIAN_SUBSCRIBER_ID']
      @request_type = args[:request_type] || ENV['EXPERIAN_REQUEST_TYPE']
      @environment = args[:environment] || ENV['ENVIRONMENT']
      @wsdl = Savon::Client.new(Experian::URL)
      @wsdl.config.log  = false
    end

    def authenticate

    end
  #Todo check with vishal regarding residence information used here
    def do_action(action, args = {})
      message = <<EOS
<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:web="http://localhost/WebService/">
  <soapenv:Header/>
    <soapenv:Body>
      <web:GetReport>
      <!--Optional:-->
        <web:Input><![CDATA[<InputData>
          <Session>
            <GroupName>#{group_name}</GroupName>
            <Subscriber_ID>#{subscriber_id}</Subscriber_ID>
            <Group_ID>#{group_id}</Group_ID>
            <User_ID>#{user_id}</User_ID>
            <RequestType>#{request_type}</RequestType>
            <Environment>#{environment}</Environment>
          </Session>
          <Consumer num="#{args[:consumer_num]}">
          <Application>
            <First_Name_1>#{args[:firstname]}</First_Name_1>
            <First_Name_2></First_Name_2>
            <Surname>#{args[:surname]}</Surname>
            <National_ID>#{args[:nationalid]}</National_ID>
            <RSAid>#{args[:rsaid]}</RSAid>  <Gender />
            <Birthday>#{args[:birthday]}19221122</Birthday>
            <Residence_Building />
            <Residence_Street />
            <Residence_Suburb />
            <Residence_City />
            <Residence_Postal_Code />
          </Application>
          </Consumer>
          <Enquirer>
            <SubscriberName>SUMMIT FINANCE</SubscriberName>
            <SubscriberTel>(011)000-0000</SubscriberTel>
          </Enquirer></InputData>]]>
        </web:Input>
      </web:GetReport>
    </soapenv:Body>
</soapenv:Envelope>
EOS

      response = @wsdl.request action do
        soap.xml = message
      end
      result =  Nori.parse(response.to_hash[:get_report_response][:output])
      if result == "Invalid Input Data"
        raise Experin::InvalidXmlError, "Input xml string is not valid"
      else
       p result
      end
    end
  end
end

#client = Experian::Client.new(
#    {
#      user_id: "SUMFIN2"  ,
#      group_id:"051739"  ,
#      group_name:"SUMMIT FINANCE" ,
#      environment:"TEST" ,
#      subscriber_id:"51739" ,
#       request_type: "CONSNLRCL"
#    }  )