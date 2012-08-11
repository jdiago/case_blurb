require 'xmpp4r/client'
require 'nokogiri'
require 'pp'
include Jabber # Makes using it a bit easier as we don't need to prepend Jabber:: to everything

# Jabber::debug = true # Uncomment this if you want to see what's being sent and received!
jid = JID::new('jrWL16opFQonUws@xmpp.esenem.com')
password = 'hdHer7O26mY5JJW'
cl = Client::new(jid)
cl.connect
cl.auth(password)

to = "JCe7zOAMux9Tk10@xmpp.esenem.com"
flag = "something here for funzies"
subject = "XMPP4R test"
body = "blahhhh"
m = Message::new(to, body).set_type(:normal).set_id('1').set_subject(subject)
nkXML = (Nokogiri::XML.parse m.to_s).children.first

pp nkXML
#nkXML.[]=('randomAttr', 'random')
(nkXML>'body')[0].content=('I\'m setting the content of this message, yo.')

pp nkXML

# Set variable for XML conversion to not add xmlns declaration at the top
no_declaration = Nokogiri::XML::Node::SaveOptions::NO_DECLARATION
newM = nkXML.to_xml(:save_with => no_declaration)
cl.send newM