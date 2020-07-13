#Docker安装脚本@Debian 10
apt  update
apt  install  -y      apt-transport-https ca-certificates curl gnupg-agent software-properties-common
curl  -fsSL     https://mirrors.ustc.edu.cn/docker-ce/linux/ubuntu/gpg    |  apt-key add -
add-apt-repository    "deb [arch=amd64] https://mirrors.ustc.edu.cn/docker-ce/linux/debian    $(lsb_release -cs)    stable"
apt  update
apt  install  -y      docker-ce docker-ce-cli containerd.io
docker run hello-world
#运行docker测试容器










#Docker安装v2rayclient @Debian 10
#导入节点信息文件
cp       /home/hj/config.json          /home/config.json
cp       /home/config.json             /usr/v2ray.json
#读取节点信息，启动容器
docker    rm    -f     v2ray
docker    run   -d    --name    v2ray    -p   8000:8000   -v   /usr:/etc/v2ray    v2ray/official   v2ray   -config=/etc/v2ray/v2ray.json
docker    logs         v2ray
docker    container    ls
netstat  -plunt
#回显容器信息









#Docker安装v2ray+tls server@Debian 10
#定义站点地址
site=<domain>
#拉取v2ray脚本并安装
apt    purge    -y     apache2
docker    rm    -f     v2ray
docker    run   -d    --name    v2ray    -p   443:443   -p   80:80   -v   $HOME/.caddy:/root/.caddy    pengchujin/v2ray_ws:0.10   $site   V2RAY_WS  15448fce-7c71-11ea-bc55-0242ac130003  
sleep     3s
docker    logs         v2ray
docker    container    ls
#显示服务器配置





