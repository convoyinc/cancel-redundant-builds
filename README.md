# cancel-redundant-builds

> Cancels redundant builds on CircleCI

The `cancel_redundant_builds.sh` script in this repo works by finding all CircleCI builds on the current branch (but with a different sha) and cancels them.

**Some things to note:**
* You'll need to make sure that you have `CIRCLE_TOKEN` available in the script's environment
* If you're using CircleCI 2.0, the workflow that canceled builds belong to will appear as if they failed, although the individual jobs will accurately show up as canceled. This is an implicit limitation of this approach and is unlikely to change until CircleCI creates a 2.0 API
