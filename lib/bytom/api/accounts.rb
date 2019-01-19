module Bytom
  class Accounts
    attr_reader :client
    private :client

    def initialize(client)
      @client = client
    end

    ##
    # Create account to manage addresses. single sign account contain only one root_xpubs and quorum; however multi sign account contain many number of root_xpubs and quorum, quorum is the number of verify signature, the range is [1, len(root_xpubs)].
    # 
    # @param [Array] root_xpubs
    # @param [Object] alias_name
    # @param [Object] quorum
    # @param [Object] access_token optional
    # 
    # @return [Hash]
    #
    def create_account(root_xpubs:[], alias_name:, quorum: 1, access_token: nil)
      params = {
          root_xpubs: root_xpubs,
          alias: alias_name,
          quorum: quorum,
          access_token: access_token
      }
      client.make_request('/create-account', 'post', params: params)
    end

    ##
    # Returns the list of all available accounts.
    #
    # @return [Hash]
    #
    def list_accounts(id: nil, alias_name:nil)
      params = {}
      params = {id: id} if id
      params = {alias: alias_name} if alias_name
      client.make_request('/list-accounts', 'post', params: params)
    end

    ##
    # By account id to update alias for the existed account.
    #
    # @param [String] account_id
    # @param [String] new_alias
    # 
    # @return [nil] nil if the account alias is updated successfully.
    #
    def update_account_alias_by_id(account_id:, new_alias:)
      params = {
          account_id: account_id,
          new_alias: new_alias
      }
      client.make_request('/update-account-alias', 'post', params: params)
    end

    ##
    # By account alias to update alias for the existed account.
    #
    # @param [String] account_alias
    # @param [String] new_alias
    #
    # @return [Nil] nil if the account alias is updated successfully.
    #
    def update_account_alias_by_alias(account_alias:, new_alias:)
      params = {
          account_alias: account_alias,
          new_alias: new_alias
      }
      client.make_request('/update-account-alias', 'post', params: params)
    end

    ##
    # Delete existed account by account id, please make sure that there is no balance in the related addresses.
    #
    # @param [String] account_id
    #
    # @return [Nil] nil if the account alias is updated successfully.
    #
    def delete_account_by_id(account_id:)
      client.make_request('/delete-account', 'post', params: {account_id: account_id})
    end

    ##
    # Delete existed account by account alias, please make sure that there is no balance in the related addresses.
    # @param [String] account_alias
    #
    # @return [Nil] nil if the account alias is updated successfully.
    #
    def delete_account_by_alias(account_alias:)
      client.make_request('/delete-account', 'post', params: {account_alias: account_alias})
    end

    ##
    # create address and control program, the address and control program is are one to one relationship. in build-transaction API, receiver is address when action type is control_address, and receiver is control program when action type is control_program, they are the same result.
    #
    # @param [String] account_id
    # @param [String] account_alias
    #
    # @return [Hash]
    #
    def create_account_receiver(account_id: nil, account_alias: nil )
      params = {}
      params = { account_id: account_id } if account_id
      params = { account_alias: account_alias } if account_alias
      return {status: 'failed'} if not params
      client.make_request('/create-account-receiver', 'post', params: params)
    end
  end
end
