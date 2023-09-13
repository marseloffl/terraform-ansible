add-content -path C:/Users/maris/.ssh/config -value @'

Host ${hostname}
  Hostname ${hostname}
  User ${user}
  IdentityFile ${identityfile}
'@