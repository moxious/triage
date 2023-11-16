# triage

This repo exists for the sole purpose of trying out automatic issue labeling triage.

This repo uses the [https://github.com/moxious/chatgpt-cli-action](moxious/chatgpt-cli-action) repo to automatically label issues whenever they are opened.

The only interesting code here is the invocation of a remote GitHub action with configuration.
See `.github/workflows/new-issue.yaml` for the whole thing.

## Example in Action

All of the issues in this repo are copies of issues from `grafana/grafana`.  [This issue](https://github.com/moxious/triage/issues/103) is a good example.

* [Here is where the bot added labels and a sample summary of the issue](https://github.com/moxious/triage/issues/103#issuecomment-1812801189).  This is an invocation of the `label_issue` workflow.
* [Here is where the bot "elaborated the issue"](https://github.com/moxious/triage/issues/103#issuecomment-1812802220) or asked the user additional questions to provide more information to make the issue easier to understand / pursue.  This is an invocation of the `elaborate_issue` workflow.

## How to Test

Copy an issue from `grafana/grafana` to this repo by running this command ([requires gh CLI installed and authenticated with a token](https://cli.github.com/manual/))

```
./copy-issue.sh 78106
```

This script will output the URL of a new issue created that is a copy of grafana/grafana's issue of the same number.
Because it's in this repo, it will be auto-labeled.

Using the gh CLI, you can even bulk/mass copy issues if you wish.

Copy all the unlabeled issues that are recent:

```
for number in $(gh search issues -R grafana/grafana --no-label --json number | jq '.[].number') ; do
   ./copy-issue.sh $number ; 
done
```

Or just copy the 10 most recent issues.

```
for number in $(gh issue list -L 10 --json number -R grafana/grafana | jq '.[].number') ; do
    ./copy-issue.sh $number ;
done
```
