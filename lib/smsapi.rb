require_relative 'smsapi/client/version'
require 'smsapi/server'
require 'smsapi/server/connection'
require 'smsapi/client'
require 'smsapi/defaults'
require 'smsapi/credits'
require 'smsapi/sms'
require 'smsapi/bulk_sms'
require 'smsapi/group_sms'

module Smsapi
  class Error < StandardError; end
  class ServerError < Error; end

  API = {
    uri: 'ssl.smsapi.pl',
    port: 443,
    user_path: '/user.do',
    sms_path: '/sms.do'
  }

  ERROR_MESSAGES = {
    '101' => 'Bad Credentials',
    '1001' => 'Bad Request Format'
  }

  # thanks to Anna Ślimak I was able to fix it as well, but a bit differently
  STATUS_STRINGS = {
    success: 'OK',
    error: 'ERROR'
  }
end
