require "experian/version"
require 'experian/client'
require "experian/core_extensions"

module Experian
  URL = "http://www3.experian.co.za/webservice/getreport.asmx?wsdl"

  def self.new(args = {})
    Experian::Client.new(args)
  end
end
#
#client = Experian.new(
#    {
#        user_id: "SUMFIN2"  ,
#        group_id:"051739"  ,
#        group_name:"SUMMIT FINANCE" ,
#        environment:"TEST" ,
#        subscriber_id:"51739"
#    }  )