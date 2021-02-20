# kataribe用のnginx.confの書き方について


## configファイルの時間形式変更
変更前
```
log_format  main  '$remote_addr - $remote_user [$time_local] "$request" '
                  '$status $body_bytes_sent "$http_referer" ' 
                  '"$http_user_agent" "$http_x_forwarded_for"';
access_log /var/log/nginx/access.log main;
```

変更後
```
log_format with_time '$remote_addr - $remote_user [$time_local] '
                     '"$request" $status $body_bytes_sent '
                     '"$http_referer" "$http_user_agent" $request_time';
access_log /var/log/nginx/access.log with_time;

```
