#installatition nginx
sudo apt install nginx

#remove default configuraton
cd /etc/nginx
sudo rm sites-enabled/default
sudo rm sites-available/default

#create new configuration
sudo nano sites-available/app1.webme.xyz
sudo nano sites-available/app2.webme.xyz
sudo nano sites-available/blogbme.xyz
sudo ln -s /etc/nginx/sites-available/app1.webme.xyz /etc/nginx/sites-enabled/
sudo ln -s /etc/nginx/sites-available/app2.webme.xyz /etc/nginx/sites-enabled/
sudo ln -s /etc/nginx/sites-available/blogme.xyz /etc/nginx/sites-enabled/

#check new configuration
me@docker:/etc/nginx$ sudo nginx -t
nginx: the configuration file /etc/nginx/nginx.conf syntax is ok
nginx: configuration file /etc/nginx/nginx.conf test is successful

#restart and check service nginx
me@docker:/etc/nginx$ sudo systemctl restart nginx.service 
me@docker:/etc/nginx$ sudo systemctl status nginx.service 
● nginx.service - A high performance web server and a reverse proxy server
     Loaded: loaded (/lib/systemd/system/nginx.service; enabled; vendor preset: enabled)
     Active: active (running) since Sat 2024-07-06 14:47:46 UTC; 6s ago
       Docs: man:nginx(8)
    Process: 2677 ExecStartPre=/usr/sbin/nginx -t -q -g daemon on; master_process on; (code=exited, status=0/SUCCESS)
    Process: 2679 ExecStart=/usr/sbin/nginx -g daemon on; master_process on; (code=exited, status=0/SUCCESS)
   Main PID: 2680 (nginx)
      Tasks: 3 (limit: 4558)
     Memory: 3.3M
        CPU: 48ms
     CGroup: /system.slice/nginx.service
             ├─2680 "nginx: master process /usr/sbin/nginx -g daemon on; master_process on;"
             ├─2681 "nginx: worker process" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" ""
             └─2682 "nginx: worker process" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" ""

Jul 06 14:47:46 docker systemd[1]: nginx.service: Deactivated successfully.
Jul 06 14:47:46 docker systemd[1]: Stopped A high performance web server and a reverse proxy server.
Jul 06 14:47:46 docker systemd[1]: Starting A high performance web server and a reverse proxy server...
Jul 06 14:47:46 docker systemd[1]: Started A high performance web server and a reverse proxy server.
