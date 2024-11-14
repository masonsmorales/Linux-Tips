#### Find the PID for the process listening on TCP/80
`sudo netstat -tunlp | grep ':80'`

#### Get details for PID 1234
`ps -p 1234 -o pid,user,comm,args`

####  List all open file descriptors for PID 1234
`sudo  ls -l /proc/1234/fd`

### List absolute paths of PID 1234 for all open file descriptors
`sudo bash -c 'for fd in /proc/10893/fd/*; do readlink -f "$fd"; done'`

####  Find largest files and folders in the current directory
`du -hs * | sort -h`

####  Send a test message to local syslog
`logger "Hello, world!"`

####  Cat all files found
`find /opt/splunk -name inputs.conf -exec cat {} \;`

####  Calculate the MD5 hash of a file
```
md5sum splunk-6.4.1-debde650d26e-Linux-x86_64.tgz
e80408d919a9fa13df8876b80c85021a  splunk-6.4.1-debde650d26e-Linux-x86_64.tgz
```

####  Calculate the SHA512 hash of a file
```
sha512sum Fedora-19-i386-netinst.iso
9eb35d03cc289aa5d5a29cfc9080c3152a3da1b91a2b12d352b16a3d817a7479b9d1be3c7ecf011abf6a01f3122c66892f96a2c213756df786117412d8df99b3  Fedora-19-i386-netinst.iso
```

####  Calculate the SHA512 hash of a file (Mac OSX)
```
shasum -a 512 kvstore.py
dc200307d2b9ff1a000b07a9b24bb20c935a8224ef1874a0aadcf18dc0228029f6cd5c87ccab5238b32160f9d0e1ea6a25cb74b99812d2fd972f12a860a477c6  kvstore.py
```
####  Process to manually add a private key file on your user account
```
cd ~/.ssh
vi mynewrsa.key (then paste your private key)
chmod 0644 mynewrsa.key
ssh-add mynewrsa.key
```

####  List all unique subdirectories two levels below /data
`find /data/*/* -type d | sed 's/\/data\/.*\///g' | sort -u`
