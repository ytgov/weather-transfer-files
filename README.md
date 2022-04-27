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

5. Connect to the server via `sftp` to test connection.

```bash
sftp -P 22 group_b@localhost
# verify server fingerprint
# enter group b's password as seen in the sftp/users.conf file
```

## Production

1. Duplicate the example sftp/users.conf.example file and edit as desired.

```bash
cp sftp/users.conf.example sftp/users.conf
nano sftp/users.conf
```

2. Generate a ed25519 and rsa key files via:
```bash
ssh-keygen -t ed25519 -f sftp/ssh_host_ed25519_key < /dev/null
ssh-keygen -t rsa -b 4096 -f sftp/ssh_host_rsa_key < /dev/null
```

4. You can generate a fingerprint for a public key using ssh-keygen like so:
```bash
# sha256 fingerprint
ssh-keygen -lf sftp/ssh_host_ed25519_key.pub > files/sha256-server-fingerprint.txt

# or md5 fingerprint
ssh-keygen -l -E md5 -f sftp/ssh_host_ed25519_key.pub > files/md5-server-fingerprint.txt
```

5. (optional) Auto-load public keys for a specific user by adding the key to the `sftp/keys_by_user` folder.
The format is `keys_by_user/user-name/.ssh/keys/id_ed25519_key.pub`, as seen in the
`sftp/keys_by_user/example_user` folder.

6. Boot the app via `docker-compose up -d --build`

7. (optional) For passwordless login, load public ssh keys for a given user via:
> Only needed if you didn't auto-load the keys earlier.
```bash
container_id=$(docker ps -q --filter name="sftp")

docker cp ~/.ssh/id_ed25519.pub $container_id:/tmp/
docker-compose exec sftp bash

# inside the container
# create an .ssh director owned by root
user="group_a"
uid="$(id -u "$user")"
user_ssh_folder="/home/$user/.ssh"
mkdir -p "$user_ssh_folder"

# add key to the authorized keys file and set owner to appropriate user
user_authorized_keys_file="$user_ssh_folder/authorized_keys"
cat "/tmp/id_ed25519.pub" >> "$user_authorized_keys_file"
chown "$uid" "$user_authorized_keys_file"
chmod 600 "$user_authorized_keys_file"
```

# For End-Users
1. Set up an example .ssh/config.
```bash
Host weather-transfer-files
    HostName some-host-name
    USER group_a
    Port 22
```
