#!/bin/bash
echo "===== Daily Log Report ====="
echo "Total lines: $(wc -l < data/server.log.txt)"
echo "Errors: $(grep -c ERROR data/server.log.txt)"
echo "User logins:"
grep "login" data/server.log.txt | awk '{print $NF}' | sort | uniq -c | sort -nr