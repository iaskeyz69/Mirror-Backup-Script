# Automatic Backup Script

This script automates the process of synchronizing user documents and desktop folders to a network location using Robocopy. Additionally, it offers an option for sending email notifications upon completion of the backup process.

## Files

- **backup_script.bat:** Batch script for synchronization.
- **send_email.py:** Python script for sending email notifications.

## Directory Structure


Directory Structure:
C:\
│
├── backup_script.bat
├── send_email.py
└── Users\
    └── [user_name]\
        ├── Documents\
        │   └── automatic-backup\
        │       └── SyncLog.txt
        └── Desktop\




## Usage

1. Edit the `config.txt` file to specify source and destination folders, as well as email notification settings.
2. Run the `backup_script.bat` file. It will synchronize the specified folders and log the activities in `SyncLog.txt`.
3. Optionally, configure the email settings in the `config.txt` file to enable email notifications upon completion of the backup process.

## Notes

- Ensure that the source and destination folders exist before running the script.
- Customize the configuration settings according to your requirements before running the script.
- The `SyncLog.txt` file will be created automatically in the `automatic-backup` folder.

For any issues or suggestions, please contact [your contact information].

