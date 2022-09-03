#!/bin/bash
arg=$1

# GET Location for the download url
curl -i -H "Accept: application/json" -H "Content-Type: application/json" -X GET $arg