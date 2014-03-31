class Response

	def initialize(client, filename)
		@filename = filename
		@client = client
		execute
	end

	def execute
		determine_response
		send_response
	end

	def determine_response
		@response = if File.exists?(@filename)
	  	File.read(@filename)
		else
	  	"File Not Found"
		end
	end

	def send_response
		@client.puts(@response)                       # Output the current time to the client
  	@client.close                     
	end
end