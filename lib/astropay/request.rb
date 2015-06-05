module Astropay

  module Request

    def post(url, params)
      uri = URI.parse(url)

      http = Net::HTTP.new(uri.host, uri.port)

      http.use_ssl = true
      http.verify_mode = OpenSSL::SSL::VERIFY_NONE

      request = Net::HTTP::Post.new(uri.path)
      request.set_form_data(params)

      response = http.request(request)

      JSON.parse(response.body)
    end

  end

end
