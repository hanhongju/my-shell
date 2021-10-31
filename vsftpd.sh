# Ftp服务器安装脚本 @ Debian 10 or Ubuntu 20.04
# 定义服务器地址
server=tx.thenote.site
# 安装
apt     -y     update    
apt     -y     install      vsftpd
ipv4=$(ping -c 2 $server | head -2 | tail -1 | awk '{print $5}' | sed 's/[(:)]//g')
echo $ipv4
echo                  "pasv_address=$ipv4"             >>            /etc/vsftpd.conf
sed         -i        's/.*\(write_enable=\).*/\1YES/g'              /etc/vsftpd.conf
sed         -i        's/.*\(listen=\).*/\1YES/g'                    /etc/vsftpd.conf
sed         -i        's/.*\(listen_ipv6=\).*/\1NO/g'                /etc/vsftpd.conf
useradd     -m        hongju      -d      /usr/hongju/
echo        -e        "fengkuang\nfengkuang"     |   passwd  hongju
systemctl   enable    vsftpd
systemctl   restart   vsftpd





