require 'spec_helper'

RSpec.describe Astropay::CreditCard do

  before {
    Astropay.configure do |c|
      c.x_login = 'XXX'
      c.x_trans_key = 'XXX'
    end
  }

  describe '#create_sale' do

    before {
      stub_request(:post, 'https://astropaycard.com/api_curl/cc/sale')
    }

    let(:sale_data) { {} }

    before { Astropay::CreditCard.new.create_sale(sale_data) }

    it 'should make a POST request' do
      expect(WebMock).to have_requested(:post, 'https://astropaycard.com/api_curl/cc/sale')
          .with(body: hash_including({ 'x_login' => 'XXX', 'x_trans_key' => 'XXX' }))
    end

  end

end
