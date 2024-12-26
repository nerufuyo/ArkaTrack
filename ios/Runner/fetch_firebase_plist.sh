#!/bin/bash

# Get the path to the GoogleService-Info.plist from the environment variable
FIREBASE_PLIST_PATH="${IOS_GOOGLE_SERIVCE_JSON}"

# Check if the environment variable is set
if [ -z "$FIREBASE_PLIST_PATH" ]; then
  echo "Error: IOS_GOOGLE_SERIVCE_JSON is not set in the environment!"
  exit 1
fi

# Check if the file exists
if [ ! -f "$FIREBASE_PLIST_PATH" ]; then
  echo "Error: GoogleService-Info.plist file not found at $FIREBASE_PLIST_PATH"
  exit 1
fi

# Copy GoogleService-Info.plist into the Runner directory
cp "$FIREBASE_PLIST_PATH" "ios/Runner/GoogleService-Info.plist"

echo "GoogleService-Info.plist copied to ios/Runner directory."
