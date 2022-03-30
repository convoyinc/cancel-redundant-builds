**DEPRECATED**: [CircleCI now has this functionality built in](https://circleci.com/docs/2.0/skip-build/#steps-to-enable-auto-cancel-for-pipelines-triggered-by-pushes-to-github-or-the-api)

# cancel-redundant-builds

> Cancels redundant builds on CircleCI

The `cancel_redundant_builds.sh` script in this repo works by finding all CircleCI builds on the current branch (but with a different sha) and cancels them.

Credit to the author of [this post](https://discuss.circleci.com/t/auto-cancel-redundant-builds-not-working-for-workflow/13852/31) who wrote the original bash script which was modified to handle workflows.

# Usage
To use the prebuilt image, add a new job to your workflow similar to the following:

```yaml
  cancel-redundant-builds:
    docker:
      - image: convoyinc/cancel-redundant-circle-builds:<tag>
    steps:
      - run:
          name: Kill redundant builds on branch
          command: /entrypoint/cancel_redundant_builds.sh
```

When you later list the job under the `workflows` key, consider adding branch filters (i.e. don't run on `master` builds).

```yaml
      - cancel-redundant-builds:
          filters:
            branches:
              ignore:
                - master
```

**Some things to note:**
* You'll need to make sure that you have `CIRCLE_TOKEN` available in the script's environment
* If you're using CircleCI 2.0, the workflow that canceled builds belong to will appear as if they failed, although the individual jobs will accurately show up as canceled. This is an implicit limitation of this approach and is unlikely to change until CircleCI creates a 2.0 API
