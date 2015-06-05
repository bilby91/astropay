module Astropay

  class API

    include Request

    attr_accessor :config

    def initialize(configuration = nil)
      @config = configuration || Astropay.configuration
    end

    def build_url(relative_url)
      (config.sandbox ? test_url : live_url) + relative_url
    end

    def request(relative_url, params)
      url = build_url(relative_url)

      post(url, params)
    end

  end

end
