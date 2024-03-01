#### dilicms3.0 

欢迎使用DIlICMS3.0,DIlICMS3.0是无业务逻辑的，面向CodeIgniter开发者的自由灵活的系统，致力于为开发者提供最简单，灵活，实用的后台CMS系统。

DIlICMS3.0是基于2.4版本开发的通用mysql数据库管理系统，原来的开发者已停止迭代开发，3.0版本主要给表单添加分组，同时兼容PHP7+而开发

bootstrap5分支，将系统ui全部更换为bootstrap5,目前已完成系统设置部分,数据表格ui正在开发中

![Image text](https://raw.githubusercontent.com/huyouqiang/dilicms3.0/main/preview/img-1.png)
![Image text](https://raw.githubusercontent.com/huyouqiang/dilicms3.0/main/preview/img-2.png)
![Image text](https://raw.githubusercontent.com/huyouqiang/dilicms3.0/main/preview/img-3.png)

#### 环境要求

apahce/nginx

php5.6-php7.4

mysql5.7

#### 根用户

用户名：adminer

初始密码：123456

#### 数据库配置

路径：shared/config/database.php

#### 数据库演示

路径：sql/dilicms3.0.sql

#### 数据源

单选/复选框（varchar）	字符串1=备注1|字符串2=备注2 例如：1=男|2=女

#### 示例url

http://domainname.com/admin/index.php

#### nginx配置

```zsh
location / {
        if (!-e $request_filename){
                rewrite ^/(.*) /index.php last;
        }
        index index.html index.php;
}
```

```zsh
location /admin {
        if (!-e $request_filename){
                rewrite ^/(.*) /admin/index.php last;
        }
        index index.html index.php;
}
```

```zsh
location ~ \.php$ {
        include fastcgi.conf;
        fastcgi_pass 127.0.0.1:9000;
        try_files $uri = 404;
}
```
 

