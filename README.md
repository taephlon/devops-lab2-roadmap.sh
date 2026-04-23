# Nginx Log Analyser 📊

A simple, efficient command-line tool written in Bash to analyze Nginx access logs. This project was developed as part of a shell scripting challenge to practice data extraction and transformation using standard Unix utilities.

## 🎯 Project Goal
The goal is to provide quick insights into web server traffic by parsing Nginx logs and identifying the most frequent visitors, requested resources, and server responses.

## 🚀 Features
The script processes a standard Nginx access log file and outputs the following metrics:
1. **Top 5 IP addresses** with the most requests.
2. **Top 5 most requested paths**.
3. **Top 5 response status codes**.
4. **Top 5 user agents**.

## 🛠️ Requirements & Tools
The analyzer is built using a "pipeline" approach with the following utilities:
* `awk`: For field extraction and pattern scanning.
* `sort`: To order data before counting and for final ranking.
* `uniq`: To identify unique entries and count occurrences (`-c`).
* `head`: To limit the output to the top 5 results.

## 📥 Installation

1. **Clone the repository** (or download the script):
   ```bash
   git clone [https://github.com/yourusername/nginx-log-analyser.git](https://github.com/yourusername/nginx-log-analyser.git)
   cd nginx-log-analyser
   ```
   
2. **Make the script Executable**
   ```bash
   chmod +x log_analyzer.sh
   ```
   
## 💻 Usage
Run the script by providing the path to your Nginx access log file:
```bash
   ./log_analyzer.sh <path_to_access_log>
```

Example:
```bash
   ./log_analyzer.sh nginx-access.log
```

Sample Output:
```bash
--------------------------------------------------
Nginx Log Analysis Report
--------------------------------------------------

Top 5 IP addresses with the most requests:
178.128.94.113 - 1087 requests
142.93.136.176 - 1087 requests
138.68.248.85 - 1087 requests
159.89.185.30 - 1086 requests
86.134.118.70 - 277 requests

Top 5 most requested paths:
/v1-health - 4560 requests
/ - 270 requests
/v1-me - 232 requests
/v1-list-workspaces - 127 requests
/v1-list-timezone-teams - 75 requests

Top 5 response status codes:
200 - 5740 requests
404 - 937 requests
304 - 621 requests
400 - 192 requests
"-" - 31 requests

Top 5 user agents:
4347 DigitalOcean Uptime Probe 0.22.0 (https://digitalocean.com) -  requests
513 Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 -  requests
332 Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 -  requests
294 Custom-AsyncHttpClient -  requests
282 Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36 -  requests

--------------------------------------------------
```

## 🧠 How It Works?
The script follows a consistent logic pattern for each metric:

*Extraction: `awk` pulls the relevant column (e.g., column 1 for IP).

*Preparation: `sort` groups identical lines together.Counting: `uniq -c` counts the occurrences of each group.

*Counting: `uniq -c` and whatsoever.

*Ranking: `sort -nr` sorts the counts numerically from highest to lowest.

*Formatting: A final `awk` command formats the output to be human-readable.

https://roadmap.sh/projects/nginx-log-analyser
