#!/bin/sh
# Get the latest ChangeLog token from a CMIS server
# Example usage: ./cmis-changelog.sh me mypassword http://myserver/cmis/url

USER=${1:-admin}
PASSWORD=${2:-admin}
URL=${3:-http://localhost:8080/alfresco/api/-default-/public/cmis/versions/1.1/atom}

curl --user $USER:$PASSWORD --insecure --silent $URL \
  | sed -e "s/.*<cmis:latestChangeLogToken>//" \
  | sed -e "s/<\/cmis:latestChangeLogToken>.*//"

echo "" # So that the command prompt is not added to the same line
