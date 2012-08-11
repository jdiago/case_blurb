require 'xmpp4r/client'
include Jabber # Makes using it a bit easier as we don't need to prepend Jabber:: to everything

# Jabber::debug = true # Uncomment this if you want to see what's being sent and received!
jid = JID::new('jrWL16opFQonUws@xmpp.esenem.com')
password = 'hdHer7O26mY5JJW'
cl = Client::new(jid)
cl.connect
cl.auth(password)

to = "JCe7zOAMux9Tk10@xmpp.esenem.com"
subject = "XMPP4R test"
body = "Hi, this is my first try from XMPP4R!!!"
m = Message::new(to, body).set_type(:normal).set_id('1').set_subject(subject)
cl.send m