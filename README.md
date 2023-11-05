# triage

This repo exists for the sole purpose of trying out automatic issue labeling triage.

This repo uses the [https://github.com/moxious/chatgpt-cli-action](moxious/chatgpt-cli-action) repo to automatically label issues whenever they are opened.

The only interesting code here is the invocation of a remote GitHub action with configuration.
See `.github/workflows/new-issue.yaml` for the whole thing.
