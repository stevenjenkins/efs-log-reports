#!/usr/bin/env ruby

require 'date' # if not in Rails
require 'apachelogregex'

# A better library seems to be the Parse::AccessLog perl module.
# The ruby gem we're using here is based on Apache-LogRegex, which uses
# the '%X' values as the keys -- human readable strings are better.
format = '%h %l %u %t \"%r\" %>s %b \"%{Referer}i\" \"%{User-Agent}i\"'
parser = ApacheLogRegex.new(format)

File.readlines("sample.txt").collect do |line|
  result = parser.parse(line)
  # want to split %r into a slice of keys
  (result['command'], result['path'], result['proto']) = result["%r"].split
  result['%t'].delete!('[')
  result['%t'].delete!(']')
# an access time looks like 26/Feb/2013:08:38:25 -0500, but
# we're just going to use it as-is for now, as a later
# version will parse and upload it, *or* we'll change the format in lighttpd
#  result['time'] = DateTime.parse(result['%t']).to_date.to_s
  (junk, result['meta'], result['proj'], result['release']) = result['path'].split("/")
  print result["proj"] + " " + result['%t'] + " by " + result['%h'] + "\n"
# here is where we would upload the accesses
# access = Access.new(meta = result['meta'], proj = result['proj'], release = result['release'], accessed_at = result['%t'], accessed_by result['%h']
#
end

