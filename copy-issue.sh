#!/bin/bash
#
# This is a simple script for copying issues from the main grafana repo to the test triage repo.
# Usage:  ./copy-issue.sh 78106
# 
# In this way, we can quickly duplicate an issue and re-label it in this repo with the action, to see
# what the results would be on the live issue.
FROM=grafana/grafana
TO=moxious/triage

number=$1
json=$(gh issue view -R $FROM $number --json title,body,labels)

title=$(echo $json | jq -r .title)

echo "Title: $title"
origissue=https://github.com/grafana/grafana/issues/$number
comment="This issue is a test copy of an issue in another repo.  Original issue: $origissue"
echo $comment

echo $json | jq -r .body > /tmp/issuebody

newissue=$(gh issue create --title "$title" --body-file /tmp/issuebody -R $TO)
gh issue comment $newissue --body "$comment"
echo "Done"
echo $newissue
