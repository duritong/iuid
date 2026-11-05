# iuid
[![Ruby](https://github.com/duritong/iuid/actions/workflows/ruby.yml/badge.svg)](https://github.com/duritong/iuid/actions/workflows/ruby.yml)

iuid is a simple username / uid storage that can autogenerate uids.

iuid will either retrieve an existing uid for a category/key or generate the next available
uid. If this uid collides with a range of the next category an exception is raised.
For each category a starting uid is configured, which will then also set the max uid by the
next category. The global max uid is 4294967295 but can be configured via the configuration
option `max_uid`.

You can use any kind of key/value based storage supported by moneta for
iuid. By default it uses a simple yaml file.

## Usage

### create

Assuming that we have an empty iuid storage.

    iuid create user1 category1

This will create (if not already stored in iuid) a random uid for the key
user1 and use category1 as a range information from which within a uid should
should be created.

If the uid already exists it will simply return the matching uid.

### get

Get simply returns a stored uid. It will not create a new uid.

Assuming that we are still working with the same storage

    iuid get user1

will return the generated uid, while

    iuid get user3

This will return nothing, as no uid has been generated so far for that user.

### set

    iuid set user3 1024

This will set the uid 1024 for the key user3

### delete

    iuid delete user1

This will delete the stored uid and return it.

## Installation

Simply build and install the gem.

## Update & Changes

See [CHANGELOG.md](CHANGELOG.md).

## Releasing

Releases are fully automated via GitHub Actions (`.github/workflows/release.yml`). The workflow runs specs, builds the gem, creates a GitHub Release with the `.gem` artifact, and publishes to RubyGems.

### Prerequisites

1. **GitHub Permissions**: In repository **Settings** → **Actions** → **General**, ensure **Workflow permissions** is set to **Read and write permissions**.
2. **RubyGems Trusted Publishing**: On [rubygems.org](https://rubygems.org), add a GitHub Actions trusted publisher for `duritong/iuid` and workflow `release.yml`.

### Triggering a Release

#### Option A: GitHub Actions UI (Manual Trigger)

1. Go to the **Actions** tab in the GitHub repository.
2. Select the **Release** workflow from the left sidebar.
3. Click **Run workflow**:
   - Leave `version` blank to release the current version in `lib/iuid/version.rb`.
   - Or provide a version (e.g. `0.2.0`) to automatically bump `version.rb`, commit, and tag.
4. Click **Run workflow**.

#### Option B: Push a Git Tag

Pushing a version tag (`v*`) automatically runs the workflow and publishes the release:

```bash
git tag v0.1.0
git push origin v0.1.0
```


## Contributing to iuid
 
* Check out the latest master to make sure the feature hasn't been implemented or the bug hasn't been fixed yet
* Check out the issue tracker to make sure someone already hasn't requested it and/or contributed it
* Fork the project
* Start a feature/bugfix branch
* Commit and push until you are happy with your contribution
* Make sure to add tests for it. This is important so I don't break it in a future version unintentionally.
* Please try not to mess with the Rakefile, version, or history. If you want to have your own version, or is otherwise necessary, that is fine, but please isolate to its own commit so I can cherry-pick around it.

## Copyright

Copyright (c) 2011 mh. See LICENSE.txt for
further details.
