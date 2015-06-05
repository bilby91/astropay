require 'astropay/version'

require 'hasugar'
require 'net/http'
require 'uri'
require 'json'

require_relative 'astropay/configuration'
require_relative 'astropay/request'

require_relative 'astropay/api'
require_relative 'astropay/streamline'
require_relative 'astropay/apd'
require_relative 'astropay/webpaystatus'

module Astropay

  class << self
    attr_accessor :configuration
  end

  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.configure
    yield(configuration)
  end

end
