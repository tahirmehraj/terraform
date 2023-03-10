#! /bin/bash
sudo yum update -y
sudo yum install htop -y
sudo yum install httpd -y
sudo yum install git -y
cd /home/ec2-user
sudo cat >> response-file <<EOL
app.bitbucketHome=/var/atlassian/application-data/bitbucket
app.defaultInstallDir=/opt/atlassian/bitbucket
app.install.service\$Boolean=true
executeLauncherAction\$Boolean=true
installation.type=INSTALL
launch.application\$Boolean=false
portChoice=default
sys.adminRights\$Boolean=true
sys.languageId=en
EOL
sudo wget https://www.atlassian.com/software/stash/downloads/binary/atlassian-bitbucket-8.8.2-x64.bin
sudo chmod +x atlassian-bitbucket-8.8.2-x64.bin
sudo ./atlassian-bitbucket-8.8.2-x64.bin -q -varfile response-file
sudo cat >> /var/atlassian/application-data/bitbucket/shared/bitbucket.properties <<EOL
setup.displayName=MyBitbucket
setup.baseUrl=http://localhost:7990
setup.license=AAABrQ0ODAoPeNp1ktFvmzAQxt/9V5y0t0gmrO20LRLSEnDVVi1EBCZVWx8MuQR3YCP7SJv/fm5AW7upDzyYz3f3+77zhzujYdlbOAsh/Lo4DxcXX6AsYn8+C1k6dBXabFc6tC76GIYsNppkTansMCpkoyysGknMkXRNcKtq1A6LY4+nC4n4Lm6ztcj/119p68HWjXSYSMLoZSwPL7gf/n63SRHPvbLHscyzTWUTobiTqo2o8nTfJLXSOSV1UJuObdAe0F4n0erypuTxzecVv0qWa56HV/cTqO8pY9SENiI7INsMlaut6kkZPf6ZzWZpVvDLLOfrPEvKuLjOUl5uhBei2KKH2kJ1BGoQJlwQujZbtNBb84g1wY+GqP+5mM/3JniDOG/HCo5jxUMAiQFtCLbKkVXVQOg7KwdkoB4cmc7vJ2DesmfWUtfvZDO68+moA/7xEediWYiEr+5f2F8tdeL2SZX6lzZPmm1EGvmPf/IvIbN7qZWTp0zEs+z6FiE2XS/1kZ0S8MK/O03wb44FOoLJKeyMz6Ud9krDFg/Ymt47YuIg22GcsJOtQ/YbXf7mATAsAhR3fMJ15aUYlNpBlXDak75Qe/9w/QIUVdE2E7l4mbBKkP79tGQ9P/6Njuo=X02kk
setup.sysadmin.username=tahir.bhat
setup.sysadmin.password=tahir131
setup.sysadmin.displayName=Tahir Bhat
setup.sysadmin.emailAddress=1@1
EOL
sudo chown atlbitbucket:atlbitbucket /var/atlassian/application-data/bitbucket/shared/bitbucket.properties
sudo service atlbitbucket start
