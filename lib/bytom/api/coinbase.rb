module Bytom
  class Coinbase
    attr_reader :client
    private :client

    def initialize(client)
      @client = client
    end

    ##
    # Get coinbase arbitrary.
    #
    def get_coinbase_arbitrary(params: {})
      client.make_request('/get-coinbase-arbitrary', 'post', params: params)
    end

    ##
    # Set coinbase arbitrary.
    #
    # @param [String] arbitrary
    #
    # @return [Hash] the abitrary data being appended to coinbase, in hexdecimal format. (The full coinbase data for a block will be `0x00`&block_height&abitrary.)
    #
    def set_coinbase_arbitrary(arbitrary:)
      params = {
          arbitrary: arbitrary
      }
      client.make_request('/set-coinbase-arbitrary', 'post', params: params)
    end
  end
end