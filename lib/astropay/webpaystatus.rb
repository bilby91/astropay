module Astropay

  class Webpaystatus < API

    def live_url
      'https://www.astropaycard.com/apd'
    end

    def test_url
      'https://sandbox.astropaycard.com/apd'
    end

    def get_payment_status(invoice)
      request_data = { 'x_invoice' => invoice }

      request_data
        .merge!(config.webpaystatus_credentials)
        .merge!('type' => 'json')

      request('/webpaystatus', request_data)
    end

  end

end
