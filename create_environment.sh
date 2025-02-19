#!/bin/bash

# Request the user's name.
read -p "ENTER YOUR NAME?:" yourname

# Define the main directory
k="submission_reminder_$yourname"

# Creation of  the main directory and moving into it
mkdir -p "$k"
cd "$k"

# Creation of  subdirectories
mkdir app modules assets config

# Creation of  script and data files
touch app/reminder.sh modules/functions.sh assets/submissions.txt config/config.env

# Giving  execution permissions only to script files
chmod +x app/reminder.sh modules/functions.sh

# Populate reminder.sh
cat <<EOF >"app/reminder.sh"
#!/bin/bash

# Load environment variables and helper functions
source ./config/config.env
source ./modules/functions.sh

# Location of the submissions file
submissions_file="./assets/submissions.txt"

# Display remaining time and trigger the reminder.
echo "Assignment: \$ASSIGNMENT"
echo "Days remaining to submit: \$DAYS_REMAINING days"
echo "--------------------------------------------"

check_submissions \$submissions_file
EOF

# Populate functions.sh
cat <<EOF >"modules/functions.sh"
#!/bin/bash

# Function to read submissions file and output students who have not submitted
function check_submissions {
    local submissions_file=\$1
    echo "Checking submissions in \$submissions_file"

    # Skip the header and iterate through the lines
    while IFS=, read -r student assignment status; do
        # Remove leading and trailing whitespace
        student=\$(echo "\$student" | xargs)
        assignment=\$(echo "\$assignment" | xargs)
        status=\$(echo "\$status" | xargs)

        # Check if assignment matches and status is 'not submitted'
        if [[ "\$assignment" == "\$ASSIGNMENT" && "\$status" == "not submitted" ]]; then
            echo "Reminder: \$student has not submitted the \$ASSIGNMENT assignment!"
        fi
    done < <(tail -n +2 "\$submissions_file") # Skip the header
}
EOF

# Populate config.env
cat <<EOF >"config/config.env"
# This is the config file
ASSIGNMENT="Shell Navigation"
DAYS_REMAINING=2
EOF

# Populate submissions.txt
cat <<EOF >"assets/submissions.txt"
student, assignment, submission status
Chinemerem, Shell Navigation, not submitted
Chiagoziem, Git, submitted
Divine, Shell Navigation, not submitted
Anissa, Shell Basics, submitted
EOF

# make startup.sh
cat <<EOF >"startup.sh"
#!/bin/bash
echo "Reminder App opening....."
bash app/reminder.sh
EOF

# Make startup.sh executable
chmod +x startup.sh

# Run the startup script
./startup.sh

