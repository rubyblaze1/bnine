#!/bin/bash

repo_path="C:\Users\Black\Desktop\b9\bnine"  # Specify the path to your repository

cd "$repo_path"

# Variables for date
start_date="2023-5-23"
end_date="2023-10-12"
current_date="$start_date"

while [ "$current_date" != "$end_date" ]; do
  # Getting changes from the remote repository and integrating them with local changes
  git pull origin main

  # Creating a new file
  new_file="file_${current_date}.txt"
  echo "Some content" > "$new_file"

  # Adding the new file
  git add "$new_file"
  
  # Creating a commit with the date information in the message
  git commit --date="$current_date" -m "Auto commit: $current_date"
  
  # Pushing changes to the server using --force
  git push origin main --force
  
  # Pause for a random interval between 30 seconds and 1 minute 30 seconds
  sleep $((30 + RANDOM % 60))
  
  # Incrementing the current date by 1 day
  current_date=$(date -d "$current_date +1 day" "+%Y-%m-%d")
done
