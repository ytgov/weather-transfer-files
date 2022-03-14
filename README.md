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

Create a user new account via:

```bash
docker-compose exec ftp bash

# inside container
mkdir /home/ftpusers/group-a
pure-pw useradd group-a -f /etc/pure-ftpd/passwd/pureftpd.passwd -m -u ftpuser -d /home/ftpusers/group-a
# then enter the password twice
```

## Production

Duplicate the example .env file and edit as desired.

```bash
cp ftp/.env.example ftp/.env
nano ftp/.env
```

Boot the app via `docker-compose up -d`
