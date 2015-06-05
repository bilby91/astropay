module Astropay

  class Streamline < API

    def live_url
      'https://astropaycard.com/api_curl/streamline'
    end

    def test_url
      'https://sandbox.astropaycard.com/api_curl/streamline'
    end

    def create_invoice(invoice_data)
      request_data = invoice_data
        .transform(
          'invoice' => 'x_invoice',
          'amount' => 'x_amount',
          'currency' => 'x_currency',
          'bank' => 'x_bank',
          'country' => 'x_country',
          'description' => 'x_description',
          'user_id' => 'x_iduser',
          'cpf' => 'x_cpf',
          'name' => 'x_name',
          'email' => 'x_email',
          'birthday' => 'x_bdate',
          'address' => 'x_address',
          'zip' => 'x_zip',
          'city' => 'x_city',
          'state' => 'x_state',
          'phone' => 'x_mobile',
          'return_url' => 'x_return',
          'confirm_url' => 'x_confirmation'
        )

      control_string = build_control_string(request_data)

      request_data
        .merge!(config.credentials)
        .merge!('control' => control_string, 'type' => 'json' )

      request('/NewInvoice', request_data)
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

      control_string = OpenSSL::HMAC.hexdigest(OpenSSL::Digest::SHA256.new, [config.secret_key].pack('A*'), [canonical_string].pack('A*'))
      control_string.upcase
    end

  end

end
