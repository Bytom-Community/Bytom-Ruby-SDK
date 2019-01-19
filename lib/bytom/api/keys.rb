module Bytom
  class Keys

    attr_reader :client
    private :client


    def initialize(client)
      @client = client
    end

    ##
    # It is to create private key essentially, returns the information of key. The private key is encrypted in the file and not visible to the user.
    #
    # @param [string] alias_name the filed alias is a keyword in ruby. so use alias_name to map.
    # @param [string] password
    # @param [string] language
    # @param [string] mnemonic Optional
    #
    # @return [Hash]
    #
    def create_key(alias_name:, password:, language: 'en', mnemonic: nil)
      params = {
          alias: alias_name,
          password: password,
          language: language,
          mnemonic: nil
      }
      client.make_request('/create-key', 'post', params: params)
    end

    ##
    # Returns the list of all available keys.
    #
    # @return [Hash]
    #
    def list_keys
      client.make_request('/list-keys', 'get')
    end

    ##
    # Update alias for the existed key.
    # 
    # @param [string] xpub
    # @param [string] new_alias
    #
    # @return [nil]
    #
    def update_key_alias(xpub:, new_alias:)
      params = {
          xpub: xpub,
          new_alias: new_alias
      }
      client.make_request('/update-key-alias', 'post', params: params)
    end
  
    ##
    # Delete existed key, please make sure that there is no balance in the related accounts.
    #
    # @param [string] xpub
    # @param [string] password
    #
    # @return [nil]
    #
    def delete_key(xpub:, password:)
      params = {
          xpub: xpub,
          password: password
      }
      client.make_request('/delete-key', 'post', params: params)
    end

    ##
    # Check key password.
    #
    # @param [string] xpub
    # @param [string] password
    #
    # @return [Hash]  check_result, result of check key password, true is check successfully, otherwise is false.
    #
    def check_key_password(xpub:, password:)
      params = {
          xpub: xpub,
          password: password
      }
      client.make_request('/check-key-password', 'post', params: params)
    end

    ##
    # Reset key password.
    #
    # @param [string] xpub
    # @param [string] old_password
    # @param [string] new_password
    #
    # @return [Hash] changed, result of reset key password, true is reset successfully, otherwise is false.
    #
    def reset_key_password(xpub:, old_password:, new_password:)
      params = {
          xpub: xpub,
          old_password: old_password,
          new_password: new_password
      }
      client.make_request('/reset-key-password', 'post', params: params)
    end

    ##
    # Returns the list of all available pubkeys by account.
    #
    # @param [String] account_alias optional
    # @param [String] account_id optional
    # @param [String] public_keyoptional
    #
    # @return [Hash]
    #
    def list_pubkeys(account_alias: nil, account_id: nil, public_key: nil)
      params = {}
      params = {account_alias: account_alias} if account_alias
      params = {account_id: account_id} if account_id
      #params = {public_key: public_key} if public_key
      client.make_request('/list-pubkeys', 'post', params: params)
    end
  end
end