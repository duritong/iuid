# iuid
[![Build Status](https://travis-ci.org/duritong/iuid.png)](https://travis-ci.org/duritong/iuid)

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

    iuid delete user1 plain

This will delete the stored uid and return it.

## Installation

Simply build and install the gem.

## Update & Changes

### to 0.0.3

1. be sure to update as well the moneta gem, iuid now uses the official moneta releases and supports current avaiable versions.
1. Options for moneta's backends have changed. For example, if you are using the yaml-backend you will likely need to change the adapter option `:path:` to `:file:` to match moneta's new API.
1. **IMPORTANT:** If you are using the yaml backend you need to migrate the current data *before* using the new iuid version! You can migrate the datastore by using the following two sed commands `sed -i -e :a -e '$!N;s/\n    value: //;ta' -e 'P;D' /PATH/TO/iuid_date.yaml` && `sed -i 's/^    /  /' /PATH/TO/iuid_date.yaml`.

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

