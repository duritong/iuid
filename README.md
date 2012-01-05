# iuid

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

Simply build and install the gem. BUT trocla is based on a not yet published
version of [moneta](https://github.com/wycats/moneta). You can build a new
moneta version based on the latest master as version 0.6.1 and instal that one.

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

