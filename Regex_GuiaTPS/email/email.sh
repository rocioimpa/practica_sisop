#!/bin/bash

var=$( echo $1 | grep '^[a-zA-Z0-9._\-]\+@[a-z0-9]\+\.[a-z0-9]\+$' )
echo $var
