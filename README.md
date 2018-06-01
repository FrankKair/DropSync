# DropSync

A simple Dropbox client to download files and folders for macOS 📦

## Installation

    $ gem install DropSync

## Usage

### Access token

Your access token can be found at [Dropbox Developers](https://www.dropbox.com/developers).

### Download

This command downloads the given file/folder to your ~/Downloads directory.

    $ dropsync access_token file_name

    $ dropsync access_token path_to_folder

    $ dropsync access_token folder_name
