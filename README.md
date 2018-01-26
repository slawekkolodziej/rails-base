Base ruby image for rails applications. It contains:

- cron
- curl
- git
- imagemagick
- ruby 2.4
- supervisor

And depending on version:
- libpq-dev (mysql-client and libmysqlclient-dev in mysql version)
- opencv (in opencv version)

Application will be placed in the /app directory
