require 'spec_helper'

describe Experian::Client do
  describe 'request' do
    it 'should return an response' do
      client = Experian::Client.new({
      user_id: "SUMFIN2"  ,
      group_id:"051739"  ,
      group_name:"SUMMIT FINANCE" ,
      environment:"TEST" ,
      subscriber_id:"51739" ,
      request_type: "CONSNLRCL"
    })
    response = client.do_action(:get_report)[:consumer_enquiry][:session][:user_id]
     expect(response).to eq("SUMFIN2")
    end
  end
end