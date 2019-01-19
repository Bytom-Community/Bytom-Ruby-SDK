module Bytom
  class AccessToken
    attr_reader :client
    private :client

    def initialize(client)
      @client = client
    end
    
    ##
    # Create access token, it provides basic access authentication for HTTP protocol, returns token contain username and password, they are separated by a colon.
    # 
    # 
    # @param [String] id token ID.
    # @param [String] type optional type of token.
    #
    def create_access_token(id:, type: nil)
      params = {
          id: id,
          type: type
      }
      client.make_request('/create-access-token', 'post', params: params)
    end

    ##
    # Returns the list of all available access tokens.
    #
    def list_access_tokens
      client.make_request('/list-access-tokens', 'post', params: {})
    end

    ##
    # Delete existed access token.
    #
    # @param [String] id
    #
    def delete_access_token(id:)
      client.make_request('/delete-access-token', 'post', params: {id: id})
    end

    ##
    # Check access token is valid.
    #
    # @param [String] id
    # @param [String] secret
    #
    def check_access_token(id: , secret:)
      params = {
          id: id,
          secret: secret
      }
      client.make_request('/check-access-token', 'post', params: params)
    end
  end
end
