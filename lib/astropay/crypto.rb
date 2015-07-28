module Astropay

  module Crypto

    def self.included(base)
      base.class_eval do
        include InstanceMethods
      end
    end

    module InstanceMethods

      def control_string(canonical_string, secret)
        control_string = OpenSSL::HMAC.hexdigest(OpenSSL::Digest::SHA256.new, [secret].pack('A*'), [canonical_string].pack('A*'))
        control_string.upcase
      end

    end

  end

end
