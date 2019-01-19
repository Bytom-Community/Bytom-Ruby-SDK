module Bytom
  class Address
    attr_reader :client
    private :client

    def initialize(client)
      @client = client
    end

    ##
    # Returns the sub list of all available addresses by account.
    # 
    # @param [String] account_alias
    # @param [String] account_id
    # @param [Fixnum] from
    # @param [Fixnum] count
    #
    # @return [Hash]
    #
    def list_addresses(account_alias:, account_id:, from: 0, count:)
      params = {
          account_alias: account_alias,
          account_id: account_id,
          from: from,
          count: count
      }
      client.make_request('/list-addresses', 'post', params: params)
    end

    ##
    # Verify the address is valid, and judge the address is own.
    #
    # @param [String] address
    #
    # @return [Hash]
    #
    def validate_address(address:)
      params = {
          address:  address
      }
      client.make_request('/validate-address', 'post', params: params)
    end

    ##
    # Query the current mining address.
    #
    def get_mining_address
      client.make_request('/get-mining-address', 'post', params: {})
    end

    ##
    # Set the current mining address, no matter whethere the address is a local one. It returns an error message if the address format is incorrect.
    #
    # @param [String] mining_address
    #
    # @return [Hash]
    #
    def set_mining_address(mining_address:)
      params = {
          mining_address: mining_address
      }
      client.make_request('/set-mining-address', 'post', params: params)
    end

  end
end
