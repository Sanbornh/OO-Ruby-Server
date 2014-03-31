class Request

	attr_accessor :filename

	def initialize(client)
		@lines = []
		@client = client
		execute
	end

	def execute
		get_request
		display_request
		get_requested_file
		return_filename
	end

	def get_request
  	while (line = @client.gets.chomp) && !line.empty?  # Read the request and collect it until it's empty
    	@lines << line
  	end
  	return @lines
	end

	def display_request
		puts @lines
	end

	def read_request_path					               # This method accepts the array of request lines
	  if /^[A-Z]+\s+\/(\S++)/ =~ @lines[0]       # We check the first line of the request to see
	    @request_path = $1                       # if it matches the "METHOD /path HTTP/1.1" format
	  end                                        # with a regular expression
	end

	def get_requested_file
		filename = read_request_path
  	@filename = filename.nil? ? "index.html" : filename
  end

  def return_filename
  	return @filename
  end

end