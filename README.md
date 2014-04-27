# Simple blog appliction
www.maxblomqvist.com

[![Code Climate](https://codeclimate.com/github/buren/mini-site.png)](https://codeclimate.com/github/buren/mini-site)


## Features

- Inline editing
- Cover photo for post
- Gallery for post
- Home / Blog / Gallery / Static page templates
- Responsive

## Configuring
Set AWS config variables so images can be uploaded in production:
```bash
export AWS_BUCKET='...'
export AWS_ACCESS_KEY_ID='...'
export AWS_SECRET_ACCESS_KEY='...'
```

## Technology

- Ruby 2.0
- Rails 3.2.13
- Rails Turbolinks
- Mercury editor 0.9.0
- jQuery 1.10.2
- Fancybox 2.1.5
- Bootstrap 2.3.0
- mySQL      (development)
- postgreSQL (production)
