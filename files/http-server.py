#!/usr/bin/python

import BaseHTTPServer, SimpleHTTPServer

httpd = BaseHTTPServer.HTTPServer(('0.0.0.0', 80), SimpleHTTPServer.SimpleHTTPRequestHandler)
httpd.serve_forever()
