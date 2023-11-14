# triage

This repo exists for the sole purpose of trying out automatic issue labeling triage.

This repo uses the [https://github.com/moxious/chatgpt-cli-action](moxious/chatgpt-cli-action) repo to automatically label issues whenever they are opened.

The only interesting code here is the invocation of a remote GitHub action with configuration.
See `.github/workflows/new-issue.yaml` for the whole thing.

## How to Test

Copy an issue from `grafana/grafana` to this repo by running this command (requires gh CLI installed and authenticated with a token)

```
./copy-issue.sh 78106
```

This script will output the URL of a new issue created that is a copy of grafana/grafana's issue of the same number.
Because it's in this repo, it will be auto-labeled.

Using the gh CLI, you can even bulk/mass copy issues if you wish.

```
for number in $(gh issue list -L 10 --json number -R grafana/grafana | jq '.[].number') ; do
    ./copy-issue.sh $number ;
done
```
