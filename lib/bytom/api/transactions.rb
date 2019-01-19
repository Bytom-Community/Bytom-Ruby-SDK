module Bytom
  class Transactions
    attr_reader :client
    private :client

    def initialize(client)
      @client = client
    end

    ##
    # Query the account related transaction by transaction ID.
    #
    # @param [String] tx_id transaction id, hash of transaction.
    #
    def get_transaction(tx_id:)
      client.make_request('/get-transaction', 'post', params: {tx_id: tx_id})
    end

    ##
    # Returns the sub list of all the account related transactions.
    #
    # @param [String] id
    # @param [String] account_id
    # @param [Boolean] detail
    # @param [OBoolean unconfirmed
    # @param [Fixnum] from
    # @param [Fixnum] count
    #
    def list_transactions(id: nil, account_id: nil, detail: nil, unconfirmed: nil, from: nil, count: nil)
      params = {
          id: id,
          account_id: account_id,
          detail: detail,
          unconfirmed: unconfirmed,
          from: from,
          count: count
      }
      client.make_request('/list-transactions', 'post', params: params)
    end

    ##
    # Build transaction.
    #
    # @param [String] base_transaction
    # @param [Fixnum] ttl
    # @param [Fixnum] time_range the block height at which this transaction will be allowed to be included in a block. If the block height of the main chain exceeds this value, the transaction will expire and no longer be valid.
    # @param [Hash] actions
    #
    def build_transaction(base_transaction: nil, ttl: 0, time_range:, actions: [])
      params = {
          base_transaction: base_transaction,
          ttl: ttl,
          time_range: time_range,
          actions: actions
      }
      client.make_request('/build-transaction', 'post', params: params)
    end

    def build_chain_transactions(base_transaction: nil, ttl:, time_range:, actions: [])
      params = {
          base_transaction: base_transaction,
          ttl: ttl,
          time_range: time_range,
          actions: actions
      }
      client.make_request('/build-chain-transactions', 'post', params: params)
    end

    ##
    # Sign transaction.
    #
    # @param [String] password
    # @param [Hash] transaction
    #
    def sign_transaction(password:, transaction: {})
      params = {
          password: password,
          transaction: transaction
      }
      client.make_request('/sign-transaction', 'post', params: params)
    end

    def sign_transactions(password: nil, transactions: [])
      params = {
          password: password,
          transactions: transactions
      }
      client.make_request('/sign-transactions', 'post', params: params)
    end

    ##
    # Submit transaction.
    #
    # @param [String] raw_transaction raw_transaction of signed transaction.
    #
    def submit_transaction(raw_transaction: {})
      params = {
          raw_transaction: raw_transaction,
      }
      client.make_request('/submit-transaction', 'post', params: params)
    end

    ##
    # Submit transactions used for batch submit transactions.
    #
    # @param [Array] raw_transactions Submit transactions used for batch submit transactions.
    #
    def submit_transactions(raw_transactions: [])
      params = {
          raw_transactions: raw_transactions,
      }
      client.make_request('/submit-transactions', 'post', params: params)
    end

    ##
    # Estimate consumed neu(1BTM = 10^8NEU) for the transaction.
    #
    def estimate_transaction_gas(transaction_template: {})
      params = {
          transaction_template: transaction_template,
      }
      client.make_request('/estimate-transaction-gas', 'post', params: params)
    end
    ##
    # Create transaction feed.
    #
    # @param [String] alias_name
    # @param [String] filter
    #
    def create_transaction_feed(alias_name:, filter:)
      params = {
          alias: alias_name,
          filter: filter
      }
      client.make_request('/create-transaction-feed', 'post', params: params)
    end

    ##
    # Query detail transaction feed by name.
    #
    def get_transaction_feed(alias_name:)
      params = {
          alias: alias_name
      }
      client.make_request('/get-transaction-feed', 'post', params: params)
    end

    ##
    # Returns the list of all available transaction feeds.
    #
    def list_transaction_feeds
      client.make_request('/list-transaction-feeds', 'post', params: {})
    end

    ##
    # Delete transaction feed by name.
    #
    # @param [String] alias_name name of the transaction feed.
    #
    def delete_transaction_feed(alias_name:)
      params = {
          alias: alias_name,
      }
      client.make_request('/delete-transaction-feed', 'post', params: params)
    end

    ##
    # Update transaction feed.
    #
    # @param [String] alias_name
    # @param [String] filter
    #
    def update_transaction_feed(alias_name:, filter:)
      params = {
          alias: alias_name,
          filter: filter
      }
      client.make_request('/update-transaction-feed', 'post', params: params)
    end

    ##
    # Query mempool transaction by transaction ID.
    #
    def get_unconfirmed_transaction(tx_id:)
      params = {
          tx_id: tx_id,
      }
      client.make_request('/get-unconfirmed-transaction', 'post', params: params)
    end

    ##
    # Returns the total number of mempool transactions and the list of transaction IDs.
    #
    def list_unconfirmed_transactions
      client.make_request('/list-unconfirmed-transactions', 'post', params: {})
    end

    ##
    # Decode a serialized transaction hex string into a JSON object describing the transaction.
    #
    def decode_raw_transaction(raw_transaction:)
      params = {
          raw_transaction: raw_transaction,
      }
      client.make_request('/decode-raw-transaction', 'post', params: params)
    end


  end
end