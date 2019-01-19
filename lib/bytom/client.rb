require 'bytom/api/keys'
require 'bytom/api/accounts'
require 'bytom/api/address'
require 'bytom/api/coinbase'
require 'bytom/api/asset'
require 'bytom/api/balances'
require 'bytom/api/access_token'
require 'bytom/api/transactions'
require 'bytom/api/block'
require 'bytom/api/core_config'
require 'bytom/api/peer'
require 'bytom/api/wallet'
require 'bytom/api/message'
require 'bytom/api/work'
require 'bytom/api/other'

require 'bytom/constants'
require 'bytom/request'

module Bytom
  # The entry point to the SDK. API endpoint categories are accessed through this object's readable
  # attributes.
  #
  # @!attribute [r] client
  #   @return [Client]
  # @!attribute [r] keys
  #   @return [Keys]
  # @!attribute [r] accounts
  #   @return [Accounts]
  # @!attribute [r] address
  #   @return [Address]
  # @!attribute [r] coinbase
  #   @return [Coinbase]
  # @!attribute [r] asset
  #   @return [Asset]
  # @!attribute [r] balances
  #   @return [Balances]
  # @!attribute [r] access_token
  #   @return [AccessToken]
  # @!attribute [r] transactions
  #   @return [Transactions]
  # @!attribute [r] block
  #   @return [Block]
  # @!attribute [r] core_config
  #   @return [CoreConfig]
  # @!attribute [r] peer
  #   @return [Peer]
  # @!attribute [r] wallet
  #   @return [Wallet]
  # @!attribute [r] message
  #   @return [Message]
  # @!attribute [r] work
  #   @return [Work]
  # @!attribute [r] other
  #   @return [Other]
  #
  class Client
    include Bytom::Constants
    attr_reader :client, :keys, :accounts, :address, :coinbase, :asset, :balances, :access_token,
                :transactions, :block, :core_config, :peer, :wallet, :message, :work, :other

    def initialize(
        base_url: API_URL,
        token: nil
    )
      @client = Request.new(base_url: base_url, token: token)
      build_categories
    end

    def build_categories
      @keys = Keys.new(client)
      @accounts = Accounts.new(client)
      @address = Address.new(client)
      @coinbase = Coinbase.new(client)
      @asset = Asset.new(client)
      @balances = Balances.new(client)
      @access_token = AccessToken.new(client)
      @transactions = Transactions.new(client)
      @block = Block.new(client)
      @core_config = CoreConfig.new(client)
      @peer = Peer.new(client)
      @wallet = Wallet.new(client)
      @message = Message.new(client)
      @work = Work.new(client)
      @other = Other.new(client)
    end

  end
end