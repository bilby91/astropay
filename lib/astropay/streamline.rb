module Astropay

  class Streamline < API

    include Crypto

    def live_url
      'https://astropaycard.com/api_curl/streamline'
    end

    def test_url
      'https://sandbox.astropaycard.com/api_curl/streamline'
    end

    def create_invoice(invoice_data)
      control_string = build_control_string(invoice_data)

      invoice_data
        .merge!(config.credentials)
        .merge!('control' => control_string, 'type' => 'json' )

      request('/NewInvoice', invoice_data)
    end

    def build_control_string(invoice_data)
      canonical_string =
        "#{invoice_data['x_invoice']}V"\
        "#{invoice_data['x_amount']}I"\
        "#{invoice_data['x_iduser']}2"\
        "#{invoice_data['x_bank']}1"\
        "#{invoice_data['x_cpf']}H"\
        "#{invoice_data['x_bdate']}G"\
        "#{invoice_data['x_email']}Y"\
        "#{invoice_data['x_zip']}A"\
        "#{invoice_data['x_address']}P"\
        "#{invoice_data['x_city']}S"\
        "#{invoice_data['x_state']}P"

      control_string(canonical_string, config.secret_key)
    end

  end

end
