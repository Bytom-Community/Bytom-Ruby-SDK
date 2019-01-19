module Bytom
  class Work
    attr_reader :client
    private :client

    def initialize(client)
      @client = client
    end

    ##
    # Get the proof of work.
    #
    def get_work
      client.make_request('/get-work', 'post', params: {})
    end

    ##
    # Submit the proof of work.
    #
    # @param [String] block_header
    #
    def submit_work(block_header:)
      client.make_request('/submit-work', 'post', params: {block_header: block_header})
    end

    ##
    # Get the proof of work by json.
    #
    def get_work_json
      client.make_request('/get-work-json', 'post', params: {})
    end

    ##
    # Submit the proof of work by json.
    # 
    def submit_work_json(block_header:)
      client.make_request('/submit-work-json', 'post', params: {block_header: block_header})
    end

  end
end


