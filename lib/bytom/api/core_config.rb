module Bytom
  class CoreConfig
    attr_reader :client
    private :client

    def initialize(client)
      @client = client
    end

    ##
    # Returns the information of current network node.
    #
    def net_info
      client.make_request('/net-info', 'post', params: {})
    end

    def gas_rate
      client.make_request('/gas-rate', 'post', params: {})
    end

    ##
    # Returns the mining status.
    #
    def is_mining
      client.make_request('/is-mining', 'post', params: {})
    end

    ##
    # Start up node mining.
    #
    def set_mining(is_mining: true)
      client.make_request('/set-mining', 'post', params: {is_mining: is_mining})
    end



  end
end