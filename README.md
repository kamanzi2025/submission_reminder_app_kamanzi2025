# submission_reminder_app_kamanzi2025

This repo contains a script (`create_environment.sh`) that automates the set up of a  submission reminder app(which shows the submission status of student school work)  

## How to Run

1. git clone https://github.com/kamanzi2025/submission_reminder_app_kamanzi2025.git
2. bash create_environment.sh (enter your name when prompted)
3. cd submission_reminder_{YourName}`
4. ./startup.sh`

## How It Works
. create_environment.sh: This script sets up the required directory structure dynamically. It asks for the user’s name and creates a directory called submission_reminder_{YourName}, where {YourName} is replaced with the provided input.

. startup.sh: This script initializes the reminder application, ensuring all components are executed correctly.

. reminder.sh: Reads student submission data and alerts them about pending deadlines.

. functions.sh: Contains helper functions to process and check submission statuses.

. submissions.txt: Stores student assignment submission records in CSV format.

## Contents

* create_environment.sh: Setup script.
* README.md: This file.
* submission_reminder_{YourName}: App directory:
    * app/reminder.sh: Main script.
    * modules/functions.sh: Helper functions.
    * assets/submissions.txt: Student data 
    * config/config.env: Environment variables.
    * startup.sh: Starts the app.

## Files

* create_environment.sh: Automates the setup of the application's directory structure.
* config.env: Assignment info.
* reminder.sh: Reminder script.
* functions.sh: Submission check function.
* submissions.txt: Student data.
* startup.sh: Runs reminder.sh.

