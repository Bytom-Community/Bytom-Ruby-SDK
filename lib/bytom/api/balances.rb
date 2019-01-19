module Bytom
  class Balances
    attr_reader :client
    private :client

    def initialize(client)
      @client = client
    end
    ##
    # Returns the list of all available account balances.
    #
    # @param [String] account_id
    # @param [String] account_alias
    #
    def list_balances(account_id: nil, account_alias: nil)
      params = {}
      params.merge!(account_id: account_id) if account_id
      params.merge!(account_alias: account_alias) if account_alias
      client.make_request('/list-balances', 'post', params: params)
    end
  end
end
