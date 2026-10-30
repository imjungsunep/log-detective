1.Display the whole log file:

command - cat data/server.log.txt

output -

2026-10-30 09:01:12 INFO User login: ravi

2026-10-30 09:02:45 ERROR Database connection failed

2026-10-30 09:05:10 INFO User login: priya

2026-10-30 09:07:33 WARN Disk usage at 85%

2026-10-30 09:10:01 INFO User login: ravi

2026-10-30 09:12:19 ERROR Payment service timeout

2026-10-30 09:15:40 INFO User login: arjun

2026-10-30 09:18:22 WARN Slow response from API

2026-10-30 09:20:05 INFO User login: ravi

2026-10-30 09:22:47 ERROR Database connection failed

2026-10-30 09:25:13 INFO User login: sneha

2026-10-30 09:27:50 INFO File uploaded by priya

2026-10-30 09:30:02 WARN Memory usage at 78%

2026-10-30 09:32:41 INFO User login: priya

2026-10-30 09:35:18 ERROR Email service unavailable

2026-10-30 09:38:09 INFO User login: arjun

2026-10-30 09:40:55 INFO Report generated

2026-10-30 09:43:27 WARN Disk usage at 90%

2026-10-30 09:45:12 INFO User login: ravi

2026-10-30 09:48:36 ERROR Database connection failed

2026-10-30 09:50:04 INFO User login: kiran

2026-10-30 09:52:48 INFO User logout: ravi

2026-10-30 09:55:21 WARN Slow response from API

2026-10-30 09:57:59 INFO User login: sneha

2026-10-30 10:00:30 INFO Backup completed

2026-10-30 10:03:14 ERROR Payment service timeout

2026-10-30 10:05:47 INFO User login: priya

2026-10-30 10:08:22 INFO User logout: priya

2026-10-30 10:10:55 WARN Too many failed attempts for kiran

2026-10-30 10:13:40 INFO User login: arjun





2.Show first 3 and last 3 lines:

command - head -n 3 data/server.log.txt

&#x20;         tail -n 3 data/server.log.txt



output -

$ head -n 3 data/server.log.txt

2026-10-30 09:01:12 INFO User login: ravi

2026-10-30 09:02:45 ERROR Database connection failed

2026-10-30 09:05:10 INFO User login: priya



$ tail -n 3 data/server.log.txt

2026-10-30 10:08:22 INFO User logout: priya

2026-10-30 10:10:55 WARN Too many failed attempts for kiran

2026-10-30 10:13:40 INFO User login: arjun

&#x20;



3.How many lines does the log have in total?

command - wc -l data/server.log.txt



output -

&#x20;wc -l data/server.log.txt

30 data/server.log.txt



4.Show all ERROR lines. How many are there?

command - grep ERROR data/server.log.txt

&#x20;         grep -c ERROR data/server.log.txt



output -

$ grep ERROR data/server.log.txt

2026-10-30 09:02:45 ERROR Database connection failed

2026-10-30 09:12:19 ERROR Payment service timeout

2026-10-30 09:22:47 ERROR Database connection failed

2026-10-30 09:35:18 ERROR Email service unavailable

2026-10-30 09:48:36 ERROR Database connection failed

2026-10-30 10:03:14 ERROR Payment service timeout



$ grep -c ERROR data/server.log.txt

6



5.Save ERROR lines into reports/errors.txt:

command - grep ERROR data/server.log.txt > reports/errors.txt



output -

2026-10-30 09:02:45 ERROR Database connection failed

2026-10-30 09:12:19 ERROR Payment service timeout

2026-10-30 09:22:47 ERROR Database connection failed

2026-10-30 09:35:18 ERROR Email service unavailable

2026-10-30 09:48:36 ERROR Database connection failed

2026-10-30 10:03:14 ERROR Payment service timeout



6.Which user logged in the most times?

command - grep "login" data/server.log.txt | awk '{print $NF}' | sort | uniq -c | sort -nr



output -

&#x20;grep "login" data/server.log.txt | awk '{print $NF}' | sort | uniq -c | sort -nr

&#x20;     4 ravi

&#x20;     3 priya

&#x20;     3 arjun

&#x20;     2 sneha

&#x20;     1 kiran



7.Why are the logout lines not counted?:

answer - Because the grep "login" command strictly filters for lines containing the word "login"excluding lines that say "logout".









\# Log Detective

\## Project Description
This project automates the process of analyzing server logs. It uses a Bash script to extract useful metrics such as total line counts, error counts, warning counts, and user login frequencies from a server log file.


\## How to Run the Script
To run the script and see the report in your terminal, open Git Bash and run:

./scripts/report.sh


To run the script and save the output directly to the reports folder, run:

./scripts/report.sh > reports/today.txt



\## Sample Output
===== Daily Log Report =====
Total lines: 30
Errors: 6
Warnings: 6
User logins:
      4 ravi
      3 priya
      3 arjun
      2 sneha
      1 kiran

