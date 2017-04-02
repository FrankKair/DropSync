# DropSync

A simple Dropbox client to download files or folders.


## Usage

1) On your terminal, call `./drop_sync_run` passing as arguments your app_key, app_secret (found at [Dropbox Developers](https://www.dropbox.com/developers)) and the name of the file you want to download.

2) Your browser will open and ask you to grant permissions by clicking a button ("Allow").

3) Afterwards, you'll be given an authorization code that you should enter in your terminal.

4) That's it :)

## Next steps

1) It would be nice to skip the permission granting part, by setting up an automatic click or something like that. I tried that approach with [Mechanize](https://github.com/sparklemotion/mechanize), but I still haven't found a way to set the request headers (thus giving a 403 error). Any help here would be valuable :)

```ruby
#!/usr/bin/env ruby
require 'mechanize'

agent = Mechanize.new do |agent|
  agent.user_agent_alias = 'Mac Safari'
end

# Your authorization page opened by the browser
auth_page = 'https://www.dropbox.com/1/oauth2/authorize?client_id=... ... ...'
page = agent.get(auth_page)

# Access the login form
login_form = page.form(:action => '/ajax_login')

# Fill the form
login_form.login_email = your_user_email
login_form.login_password = your_user_password
login_button = login_form.buttons.first

# TODO: Request headers
results = agent.submit(login_form, login_button)
```

2) Get the file size to check download completion when using this script coupled with another services.
