#!/bin/bash

#############################################

# Author: Jason Kralik
# Purpose: Automate checking if URL valid
#
# FileName: checkURL.sh
# Created: 02/01/19
# Modifed:

#############################################

myURL=$1

curl -s --head $myURL | head -n 1 | grep "[01]" | cut -d\   -f2
# HTTP status code returned:
	# 200 OK.
	# 300 Multiple choices.
	# 301 Moved permanently.
	# 302 Moved temporarily.
	# 304 Not modified.
	# 307 Temporary redirect.
	# 400 Bad request.
	# 401 Unauthorized.
	# 404 Not found.
	# 410 Gone.
	# 429 Too many requests.
	# 500 Internal server error.
	# 501 Not implemented.
	# 503 Service unavailable.
	# 550 Permission denied.
