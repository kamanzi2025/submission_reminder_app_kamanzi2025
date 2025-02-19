# submission_reminder_app_kamanzi2025

This repo contains a script (`create_environment.sh`) to set up a submission reminder app.

## How to Run

1. `git clone ...` (replace `{your_github_username}`)
2. `bash create_environment.sh` (enter your name when prompted)
3. `cd submission_reminder_{YourName}`
4. `./startup.sh`

## Contents

* `create_environment.sh`: Setup script.
* `README.md`: This file.
* `submission_reminder_{YourName}`: App directory:
    * `app/reminder.sh`: Main script.
    * `modules/functions.sh`: Helper functions.
    * `assets/submissions.txt`: Student data (add at least 5 records).
    * `config/config.env`: Environment variables.
    * `startup.sh`: Starts the app.

## Files

* `config.env`: Assignment info.
* `reminder.sh`: Reminder script.
* `functions.sh`: Submission check function.
* `submissions.txt`: Student data (CSV format).
* `startup.sh`: Runs `reminder.sh`.

