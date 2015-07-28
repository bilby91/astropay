require 'spec_helper'

RSpec.describe Astropay::Streamline do

  before {
    Astropay.configure do |c|
      c.x_login = 'XXX'
      c.x_trans_key = 'XXX'
    end
  }

  describe '#create_invoice' do

    before {
      stub_request(:post, 'https://astropaycard.com/api_curl/streamline/NewInvoice')
    }

    let(:invoice_data) { {} }

    before { Astropay::Streamline.new.create_invoice(invoice_data) }

    it 'should make a POST request' do
      expect(WebMock).to have_requested(:post, 'https://astropaycard.com/api_curl/streamline/NewInvoice')
          .with(body: hash_including({ 'x_login' => 'XXX', 'x_trans_key' => 'XXX' }))
    end

  end

end
