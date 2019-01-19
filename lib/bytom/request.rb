require 'http'
module Bytom
  ##
  # @!attribute [r] base_url pass by class client
  # @!attribute [r] token pass by class client
  #
  class Request
    attr_reader :base_url, :token

    def initialize(
        base_url: nil,
        token: nil
    )
      @base_url = base_url
      @token = token
    end

    ##
    # send a http request.
    #
    def make_request(path, method = 'get', params: {})
      http_client = HTTP.headers(:accept => "application/json")
      http_client.auth("Bearer " + token) if token
      if method == 'get'
        http_client.get(base_url + path).parse
      elsif method == 'post'
        http_client.post(base_url + path, :json => params).parse
      end
    end

  end
end