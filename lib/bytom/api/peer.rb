module Bytom
  class Peer
    attr_reader :client
    private :client

    def initialize(client)
      @client = client
    end

    ##
    # Returns the list of connected peers.
    #
    def list_peers
      client.make_request('/list-peers', 'post', params: {})
    end

    ##
    # Disconnect to specified peer.
    #
    # @param [String] peer_id
    #
    def disconnect_peer(peer_id:)
      client.make_request('/disconnect-peer', 'post', params: {peer_id: peer_id})
    end

    ##
    # Connect to specified peer.
    #
    # @param [String] ip peer IP address.
    # @param [Fixnum] port peer port.
    #
    def connect_peer(ip:, port:)
      params = {
          ip: ip,
          port: port
      }
      client.make_request('/connect-peer', 'post', params: params)
    end

  end
end

