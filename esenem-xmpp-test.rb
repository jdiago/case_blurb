require 'xmpp4r/client'
require 'nokogiri'
require 'pp'
include Jabber # Makes using it a bit easier as we don't need to prepend Jabber:: to everything

if __FILE__ == $0
	# Jabber::debug = true # Uncomment this if you want to see what's being sent and received!
	jid = JID::new('jrWL16opFQonUws@xmpp.esenem.com')
	password = 'hdHer7O26mY5JJW'
	cl = Client::new(jid)

	cl.connect
	cl.auth(password)

	to = "JCe7zOAMux9Tk10@xmpp.esenem.com"
	subject = "XMPP4R test"
	body = "blahhhh"
	# m = Message::new(to, body).set_type(:normal).set_id('1').set_subject(subject)
	# nkXML = (Nokogiri::XML.parse m.to_s).children.first

	# # Eg. for adding/manipulating attributes
	# nkXML.[]=('senderNickname', 'RedBull')
	# (nkXML>'body')[0].content=('Online!')

	# # pp nkXML

	# # Set variable for XML conversion to not add xmlns declaration at the top
	# no_declaration = Nokogiri::XML::Node::SaveOptions::NO_DECLARATION
	# newM = nkXML.to_xml(:save_with => no_declaration)
	
	# Send message 
	# cl.send newM


	# Add the callback to listen for messages
	cl.add_message_callback do |m|
	  if m.type != :error
	    print "#{m.from}: #{m.body}\n"
	    print "Enter message: "
	  end
	end

	puts "Welcome to ESENEM Chat!\n"
	puts "Enter 'x' to quit\n\n"
	puts "Enter message: "
	STDOUT.flush
	body = gets.chomp
	while body != "x"
		m = Message::new(to, body).set_type(:normal).set_id('1').set_subject(subject)
		cl.send(m)
		puts "Enter message: "
		STDOUT.flush
		body = gets.chomp
	end
end