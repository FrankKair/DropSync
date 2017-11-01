# DropSync

A simple Dropbox client to download/upload files and folders.

## Status

The gem is currently not working because Dropbox discontinued the version 1 of the Ruby API.
The v2 API does not support Ruby, but there are some people working on this issue.

More info: https://blogs.dropbox.com/developers/2017/09/api-v1-shutdown-details/

## Installation

    $ gem install DropSync

## Usage

### Access token

Your access token can be found at [Dropbox Developers](https://www.dropbox.com/developers).

### Download

This command downloads the given file to your ~/Downloads directory.

	$ dropsync access_token download filename

### Upload

This command uploads the given file to the root directory of your Dropbox.

    $ dropsync access_token upload path_to_file

The path to file may be something like `~/Desktop/my_folder/text_file.txt`
