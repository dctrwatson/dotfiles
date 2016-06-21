#!/usr/bin/env ruby
require "base64"
require "pp"
require "hexdump"



s = [
    "AAANIAAACDQAAAAB",
    "AAALQAAABwgAAAAB",
    "AAAIAAAABQAAAAAB",
    "AAAGcgAABBoAAAAB",
    "AAAKAAAABkAAAAABACAAAA==",
    "AAAKAAAABaAAAAABACAAAA==",
    "AAAHgAAABLAAAAABACAAAA==",
    "AAAHgAAABDgAAAABACAAAA==",
    "AAAFAAAAAtAAAAABACAAAA==",
    "AAAFoAAAA4QAAAAB",
    "AAAFAAAAAyAAAAAB",
    "AAAEgAAAAtAAAAAB",
    "AAADSAAAAg0AAAAB",
    "AAAEAAAAAwAAAAAB",
    "AAADIAAAAlgAAAAB",
    "AAACgAAAAeAAAAAB",
    "AAANIAAACDQAAAAJAKAAAA==",
    "AAALQAAABwgAAAAJAKAAAA==",
    "AAAKAAAABkAAAAAJAKAAAA==",
    "AAAKAAAABaAAAAAJAKAAAA==",
    "AAAIAAAABQAAAAAJAKAAAA==",
    "AAAGcgAABBoAAAAJAKAAAA==",
    "AAAHgAAABLAAAAAJAKAAAA==",
    "AAAHgAAABDgAAAAJACAAAA==",
    "AAAFAAAAAtAAAAAJACAAAA==",
    "AAAPAAAACWAAAAAB",
]

s.each do |encoded|
    decoded = Base64.decode64 encoded
    Hexdump.dump decoded

    pp decoded.unpack("nnnnCCCCCCCC")

    puts
end


puts Base64.encode64([ 0, 2304, 0, 1440, 0, 0, 0, 1               ].pack("nnnnCCCC"))

# puts Base64.encode64([ 0, 640,  0, 480, 0, 0, 0, 1               ].pack("nnnnCCCC"))
# puts Base64.encode64([ 0, 800,  0, 600, 0, 0, 0, 1               ].pack("nnnnCCCC"))

#puts Base64.encode64([ 0, 1024, 0, 640, 0, 0, 0, 1               ].pack("nnnnCCCC"))
#puts Base64.encode64([ 0, 1024, 0, 768, 0, 0, 0, 1               ].pack("nnnnCCCC"))

#puts Base64.encode64([ 0, 2048, 0, 1280, 0, 0, 0, 9, 0, 128, 0, 0 ].pack("nnnnCCCCCCCC"))
#puts Base64.encode64([ 0, 2048, 0, 1536, 0, 0, 0, 9, 0, 160, 0, 0 ].pack("nnnnCCCCCCCC"))
