require 'socket'
require './request'
require './response'

class Server

	def initialize(port)
		@host = 'localhost'
		@port = port																				
		execute
	end

	def execute
		start_server
		loop do
			wait_for_request
			get_request
			send_response
		end
	end

	def start_server
		@server = TCPServer.open(@host, @port)                 # Socket to listen to defined host and port
		puts "Server started on #{@host}:#{@port} ..."         # Output to stdout that server started
	end

	def wait_for_request
		@client = @server.accept
	end

	def get_request
		@new_request = Request.new(@client)
		@request = @new_request.return_filename
	end

	def send_response
		@response = Response.new(@client, @request)
	end

end


port = ARGV[0].to_i
Server.new(port)