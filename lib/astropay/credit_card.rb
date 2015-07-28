module Astropay

  class CreditCard < API

    include Crypto

    def live_url
      'https://astropaycard.com/api_curl'
    end

    def test_url
      'https://sandbox.astropaycard.com/api_curl'
    end

    def create_sale(sale_data)
      control_string = build_sale_control_string(sale_data)

      sale_data
        .merge!(config.credentials)
        .merge!('control' => control_string, 'type' => 'json' )

      request('/cc/sale', sale_data)
    end

    def get_card_information(card_number, country_code)
      card_data = { 'x_bin' => card_number, 'x_country' => country_code, 'type' => 'json' }.merge(config.credentials)

      request('/query/search_bin', card_data)
    end


    def build_sale_control_string(invoice_data)
      canonical_string =
        "#{invoice_data['x_invoice']}"\
        "#{invoice_data['x_amount']}"\
        "#{invoice_data['x_currency']}"\
        "#{invoice_data['x_email']}"\
        "#{invoice_data['cc_number']}"\
        "#{invoice_data['cc_exp_month']}"\
        "#{invoice_data['cc_cvv']}"\
        "#{invoice_data['cc_exp_year']}"\
        "#{invoice_data['x_cpf']}"\
        "#{invoice_data['x_country']}"\
        "#{invoice_data['cc_token']}"

      control_string(canonical_string, config.secret_key)
    end

    def build_refund_control_string(invoice_data)
      canonical_string =
        "#{invoice_data['x_document']}"\
        "#{invoice_data['x_invoice']}"\
        "#{invoice_data['x_amount']}"\
        "#{invoice_data['x_currency']}"

      control_string(canonical_string, config.secret_key)
    end

  end

end
