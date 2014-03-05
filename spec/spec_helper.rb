$:.unshift(File.expand_path('../../lib', __FILE__))

require 'rspec'
require 'experian'
require 'vcr'

# disable Savon and HTTPI logs
Savon.configure { |c| c.log = false }
HTTPI.log = false

