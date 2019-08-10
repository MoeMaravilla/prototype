#!/usr/bin/ruby -w
require 'digest/md5'
digest = Digest::MD5.hexdigest(DATA.read)
puts digest
__END__
