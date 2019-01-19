module Bytom
  class Asset
    attr_reader :client
    private :client

    def initialize(client)
      @client = client
    end

    ##
    # Create asset definition, it prepares for the issuance of asset.
    #
    # @param [String] alias_name
    # @param [Hash] definition
    # @param [Array] root_xpubs
    # @param [Fixnum] quorum
    # @param [String] issuance_program
    #
    # @return [Hash]
    #
    def create_asset(alias_name:, definition: {}, root_xpubs: [], quorum: 1, issuance_program: nil)
      params = {
          alias: alias_name,
          definition: definition,
      }
      params.merge!(issuance_program: issuance_program) if issuance_program
      params.merge!(root_xpubs: root_xpubs, quorum: quorum) if not root_xpubs.empty?
      client.make_request('/create-asset', 'post', params: params)
    end

    ##
    # Query detail asset by asset ID.
    #
    # @param [String] id
    #
    def get_asset(id:)
      params = {
          id: id
      }
      client.make_request('/get-asset', 'post', params: params)
    end
    ##
    # Returns the list of all available assets.
    #
    def list_assets
      client.make_request('/list-assets', 'post', params: {})
    end

    ##
    # Update asset alias by assetID.
    #
    # @param [String] id
    # @param [String] alias_name
    #
    def update_asset_alias(id:, alias_name:)
      params = {
          id: id,
          alias: alias_name
      }
      client.make_request('/update-asset-alias', 'post', params: params)
    end
  end
end