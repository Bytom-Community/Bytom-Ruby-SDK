module Bytom
  class Message
    attr_reader :client
    private :client

    def initialize(client)
      @client = client
    end

    ##
    # Verify a signed message with derived pubkey of the address.
    #
    # @param [String] address
    # @param [String] derived_xpub
    # @param [String] message
    # @param [String] signature
    #
    def verify_message(address:, derived_xpub:, message:, signature:)
      params = {
          address: address,
          derived_xpub: derived_xpub,
          message: message,
          signature: signature
      }
      client.make_request('/verify-message', 'post', params: params)
    end

    ##
    # Sign a message with the key password(decode encrypted private key) of an address.
    #
    # @param [String] address
    # @param [String] message
    # @param [String] password
    #
    # @return [Hash] signature, derived_xpub
    #
    def sign_message(address:, message:, password:)
      params = {
          address: address,
          message: message,
          password: password
      }
      p params
      client.make_request('/sign-message', 'post', params: params)
    end

  end
end
