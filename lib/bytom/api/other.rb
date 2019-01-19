module Bytom
  class Other

    attr_reader :client
    private :client


    def initialize(client)
      @client = client
    end

    ##
    # Decode program.
    #
    # @param [String] program
    #
    def decode_program(program:)
      client.make_request('/decode-program', 'post', params: {program: program})
    end

    ##
    # Compile equity contract.
    #
    def compile(contract:, args: [])
      params = {
          contract: contract,
          args: args
      }
      client.make_request('/compile', 'post', params: params)
    end

    ##
    # Returns the sub list of all available unspent outputs for all accounts in your wallet.
    #
    # @param [String] id
    # @param [Boolean] unconfirmed
    # @param [Boolean] smart_contract
    # @param [Fixnum] from
    # @param [Fixnum] count
    # @param [String] account_id
    # @param [String] account_alias
    #
    def list_unspent_outputs(id: nil, unconfirmed: nil, smart_contract: nil, from: nil, count: nil, account_id: nil, account_alias: nil)
      params = {
          id: id,
          unconfirmed: unconfirmed,
          smart_contract: smart_contract,
          from: from,
          count: count,
          account_id: account_id,
          account_alias: account_alias
      }
      client.make_request('/list-unspent-outputs', 'post', params: params)
    end
  end
end