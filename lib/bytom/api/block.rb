module Bytom
  class Block
    attr_reader :client
    private :client

    def initialize(client)
      @client = client
    end

    def get_block_count
      client.make_request('/get-block-count', 'post', params: {})
    end
    ##
    # Returns the current block hash for blockchain.
    #
    def get_block_hash
      client.make_request('/get-block-hash', 'post', params: {})
    end

    ##
    # Returns the detail block by block height or block hash.
    #
    # @param [String] block_height optional
    # @param [String] block_hash optional
    #
    def get_block(block_height: nil, block_hash: nil)
      params = {
          block_height: block_height,
          block_hash: block_hash
      }
      client.make_request('/get-block', 'post', params: params)
    end

    ##
    # Returns the detail block header by block height or block hash.
    #
    # @param [String] block_height optional
    # @param [String] block_hash optional
    #
    def get_block_header(block_height: nil, block_hash: nil)
      params = {
          block_height: block_height,
          block_hash: block_hash
      }
      client.make_request('/get-block-header', 'post', params: params)
    end

    ##
    # Returns the block difficulty by block height or block hash.
    #
    # @param [String] block_height optional
    # @param [String] block_hash optional
    #
    def get_difficulty(block_height: nil, block_hash: nil)
      params = {
          block_height: block_height,
          block_hash: block_hash
      }
      client.make_request('/get-difficulty', 'post', params: params)
    end

    ##
    # Returns the block hash rate by block height or block hash, it returns the current block hash rate when request is empty.
    # 
    # @param [String] block_height optional
    # @param [String] block_hash optional
    #
    def get_hash_rate(block_height: nil, block_hash: nil)
      params = {
          block_height: block_height,
          block_hash: block_hash
      }
      client.make_request('/get-hash-rate', 'post', params: params)
    end
  end
end