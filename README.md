# forge-container
Small spaces for forges to work from

# Setup users

To setup users add their respective `uid`'s, `username`'s and `password`'s in
file `./conf/users.conf`.

For example:

```
bart:simpson:1001
jackie:chan:1002
```

# Running

```bash
docker-compose up
```

# Logging in

```
sftp -P 2222 bart@localhost
```
Enter `simpson` as the password
