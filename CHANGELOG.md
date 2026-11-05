# Changelog

## to 0.1.0

* Drop support for EOL Ruby versions (< 3.1)
* Support Ruby 3.1, 3.2, 3.3, 3.4, 4.0, head and JRuby
* Update dependencies (Moneta ~> 1.6, add explicit pstore dependency)
* Move from Travis-CI to GitHub Actions
* Remove Jeweler dependency and use standard gemspec
* Fix `File.exists?` deprecation for Ruby 3.2+
* Fix `--version` CLI option
* Setup Dependabot and release workflow
