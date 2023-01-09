#resilio-sync服务器搭建 @ Debian 10
sudo       su
apt        -y      update    
apt        -y      install    wget
wget       https://download-cdn.resilio.com/2.7.3.1381/Debian/resilio-sync_2.7.3.1381-1_amd64.deb    -O    resilio-sync.deb
dpkg       -i      resilio-sync.deb
echo   '
{"storage_path" : "/home/resilio-sync/"
,"pid_file"     : "/var/run/resilio-sync/sync.pid"
,"webui" :{"force_https" : false
          ,"listen"      : "0.0.0.0:8888"
          }
}
'    >     /etc/resilio-sync/config.json
systemctl  enable  resilio-sync
systemctl  restart   resilio-sync
netstat    -plnt




