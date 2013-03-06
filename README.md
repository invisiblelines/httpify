Httpify
=======

Adds a method on String to add the http(s) prefix 

Usage
-----

Include in your ActiveRecord model and specify any attributes you wish to
automatically be prefixed with http://...

Example
-------

    class Link
      include Httpify
      attr_accessor :url
      httpify :url
    end

    link = Link.new
    link.url = "google.com"
    link.url # Returns http://google.com

The gem also exposes a method on String

    "mydomain.com".httpify

Options available:

    "mydomain.com".httpify(:https => true, :trailing_slash => true)


Copyright
---------

Copyright (c) 2010 Kieran Johnson. See LICENSE for details.