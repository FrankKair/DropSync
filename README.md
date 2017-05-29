# DropSync

A simple Dropbox client to download/upload files and folders.

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