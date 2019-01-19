module Bytom
  class Wallet
    attr_reader :client
    private :client

    def initialize(client)
      @client = client
    end

    ##
    # Backup wallet to image file, it contain accounts image, assets image and keys image.
    #
    def backup_wallet
      client.make_request('/backup-wallet', 'post', params: {})
    end

    ##
    # Restore wallet by image file.
    #
    # @param [Hash] account_image
    # @param [Hash] asset_image
    # @param [Hash] key_images
    #
    def restore_wallet(account_image: {}, asset_image: {}, key_images: {})
      params = {
          account_image: account_image,
          asset_image: asset_image,
          key_images: key_images
      }
      client.make_request('/restore-wallet', 'post', params: params)
    end

    ##
    # Trigger to rescan block information into related wallet.
    #
    def rescan_wallet
      client.make_request('/rescan-wallet', 'post', params: {})
    end

    ##
    # Recovery wallet and accounts from root XPubs.
    # All accounts and balances of bip44 multi-account hierarchy for deterministic wallets can be restored via root xpubs.
    #
    # @param [Array] xpubs
    #
    def recovery_wallet(xpubs: [])
      client.make_request('/recovery-wallet', 'post', params: {xpubs: xpubs})
    end

    ##
    # Return the information of wallet.
    #
    def wallet_info
      client.make_request('/wallet-info', 'post', params: {})
    end
  end
end
