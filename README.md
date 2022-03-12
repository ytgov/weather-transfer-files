# Weather Transfer Files

## Content coming soon...

## Development

1. Build the container via

`docker-compose build`

2. Boot the container via

`docker-compose up`

3. Go to `localhost` in your browser to see the app
   landing page.

4. Go to `localhost/files` to see the upload files by group.

5. To add files to a specific group log in as that group via `ftp`

```bash
ftp -vn localhost 21
```

## Production

Create a user account via:

```bash
docker-compose exec ftp sh

pure-pw useradd some-user -f /etc/pure-ftpd/passwd/pureftpd.passwd -m -u ftpuser -d /home/ftpusers/some-user
# then follow the password prompts
```
