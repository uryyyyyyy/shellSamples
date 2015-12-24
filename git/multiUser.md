
# use multi GitHub account in 1 Linux user

## premise

- two account
  - default user
  - company user
- 1 linux user

## ssh

### create two ssh key

```
ssh keygen ~~~

# default
# create `id_rsa`

# company
# create `id_rsa_company`

```

### set two key to GitHub

login Github and set ssh pub_key

### edit config

```~/.ssh/config
# default user
Host github.com
  HostName github.com
  User git
  Port 22
  IdentityFile ~/.ssh/id_rsa
  TCPKeepAlive yes
  IdentitiesOnly yes

# company user
Host github-company
  User git
  Port 22
  HostName github.com
  IdentityFile ~/.ssh/id_rsa_company
  TCPKeepAlive yes
  IdentitiesOnly yes
```

### ssh access

# default
same as normal.

# company

when target repo URI is `git@github.com:yourGroup/yourProject.git`, convert it to `git@github-company:yourGroup/yourProject.git`.

it means ssh check the host `github-company` and find it in `~/.ssh/config`, then use `Host => github.com, `, `keyFile => ~/.ssh/id_rsa_company`

## git

`cd <repo rootDir>`

### default
no need to do. git will use `global user.name/email`

### company

apply these command
```
git config --local user.name "your name for company"
git config --local user.email "yourEmail@yourCompany.com"
```

