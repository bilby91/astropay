module Astropay

  class Configuration

    attr_accessor :x_login, :x_trans_key, :secret_key, :x_login_webpaystatus,
                  :x_trans_key_webpaystatus, :sandbox, :ssl_enabled

    def credentials
      {
        'x_login' => x_login,
        'x_trans_key' => x_trans_key
      }
    end

    def webpaystatus_credentials
      {
        'x_login_webpaystatus' => x_login_webpaystatus,
        'x_trans_key_webpaystatus' => x_trans_key_webpaystatus
      }
    end

  end

end
