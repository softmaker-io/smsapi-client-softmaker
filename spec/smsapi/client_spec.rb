require 'spec_helper'

describe Smsapi::Client do
  before do
    @server = double('server')
    allow(Smsapi::Server).to receive_messages(new: @server)

    @sms = double('sms', deliver: 'OK:123:0.5')
    allow(Smsapi::SMS).to receive_messages(new: @sms)
  end

  subject { described_class.new('token123') }

  it 'builds a server connection' do
    token = 'token123'
    expect(Smsapi::Server).to receive(:new).with(token)

    described_class.new(token)
  end

  describe '#credits' do
    let(:client) { described_class.new('token123') }

    let(:expected) { [@server, {}] }
    let(:smsapi_credits_spy) { instance_double(Smsapi::Credits) }

    before do
      allow(Smsapi::Credits).to receive(:new).with(*expected).and_return(smsapi_credits_spy)
      allow(smsapi_credits_spy).to receive(:check).and_return(true)
    end

    it 'get details' do
      expect(Smsapi::Credits).to receive(:new).with(*expected)
      client.credits
    end
  end

  describe '#send_single' do
    let(:client) { described_class.new('token123') }

    it 'creates a SMS' do
      expect(Smsapi::SMS).to receive(:new)
      client.send_single('500000000', 'message')
    end

    it 'delivers the created SMS' do
      expect(@sms).to receive(:deliver)
      client.send_single('500000000', 'message')
    end

    it 'includes server in the args' do
      expected = [
        '123456789',
        'Message',
        @server,
        {}
      ]
      given = [
        '123456789',
        'Message',
      ]

      expect(Smsapi::SMS).to receive(:new).with(*expected)
      client.send_single(*given)
    end
  end

  describe '#send_bulk' do
    pending 'Not implemented'
  end
end
