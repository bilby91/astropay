module Astropay

  class APD < API

    def live_url
      'https://astropaycard.com/api_curl/apd'
    end

    def test_url
      'https://sandbox.astropaycard.com/api_curl/apd'
    end

    def get_banks_for_country(country_code)
      request_data = { 'country_code' => country_code }

      request_data
        .merge!(config.credentials)
        .merge!('type' => 'json')

      request('/get_banks_by_country', request_data)
    end

  end

end
