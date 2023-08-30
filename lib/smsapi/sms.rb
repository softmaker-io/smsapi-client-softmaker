module Smsapi
  class SMS
    include Smsapi::Defaults

    attr_accessor :to, :message, :id, :points, :status, :error_code, :date
    def initialize(to, message, server, options = {})
      @options = default_options.merge options
      @to = to
      @message = message
      @server = server
    end

    def deliver
      read_response @server.sms(server_params).first
      self
    end

    def deliver_at(date)
      @date = date
      params = server_params.merge(date: date.to_time.to_i)

      read_response @server.sms(params).first
      self
    end

    def sent?
      not self.status.nil?
    end

    def error?
      self.status == STATUS_STRINGS[:error]
    end

    def success?
      self.status == STATUS_STRINGS[:success]
    end

    def error_message
      Smsapi::ERROR_MESSAGES[error_code]
    end

    def read_response(response)
      response = response.split(':')

      self.status = response[0]
      if status == STATUS_STRINGS[:error]
        self.error_code = response[1]
      else
        self.id = response[1]
        self.points = response[2]
      end
    end

    private

    def server_params
      @options.merge(
        to: to,
        message: message
      )
    end
  end
end
