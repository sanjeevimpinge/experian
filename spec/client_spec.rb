require 'spec_helper'

describe Experian::Client do
  describe 'request' do
    it 'should return an client object with values specified' do
      client = Experian::Client.new({
      user_id: "SUMFIN2"  ,
      group_id:"051739"  ,
      group_name:"SUMMIT FINANCE" ,
      environment:"TEST" ,
      subscriber_id:"51739" ,
      request_type: "CONSNLRCL"
    })
    expect(client.user_id).to eq("SUMFIN2")
    end

    it 'should return an response by using Env variables' do
      ENV['EXPERIAN_USER_ID'] = "SUMFIN2"
      ENV['EXPERIAN_GROUP_ID'] = "051739"
      ENV['EXPERIAN_GROUP_NAME'] = "SUMMIT FINANCE"
      ENV['EXPERIAN_SUBSCRIBER_ID'] = "51739"
      ENV['EXPERIAN_REQUEST_TYPE'] = "CONSNLRCL"
      ENV['ENVIRONMENT'] =  "TEST"
      necessary_fields = {
          surname: "SMITH"  ,
          firstname: "JOHN" ,
          nationalid: '2211229990867'  ,
          birthday: '19221122' ,
          consumer_num: '0000024001',
          rsaid:'YES'
      }
      client = Experian::Client.new
      response = client.do_action(:get_report, necessary_fields)[:consumer_enquiry][:session][:user_id]
      expect(response).to eq("SUMFIN2")
    end
  end
end