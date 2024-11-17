#### dilicms3.0

>dilicms3.0是基于2.4版本开发的通用mysql数据库管理系统，原来的开发者已停止迭代开发，3.0版本主要给表单添加分组，同时兼容PHP7+而开发

>master分支，为旧款ui，拥有表单分组功能，但字段类型缺乏json等新类型支持

>bootstrap5分支，将系统ui全部更换为bootstrap5,目前已完成系统设置部分,数据表格ui和功能已开发完成

![Image text](https://raw.githubusercontent.com/huyouqiang/dilicms3.0/bootstrap5/preview/img-01.png)
![Image text](https://raw.githubusercontent.com/huyouqiang/dilicms3.0/bootstrap5/preview/img-02.png)
![Image text](https://raw.githubusercontent.com/huyouqiang/dilicms3.0/bootstrap5/preview/img-03.png)

#### 环境要求

>apahce/nginx

>php5.6-php7.4

>mysql5.7

#### 根用户

>用户名：adminer

>初始密码：123456

#### 数据库配置

>路径：shared/config/database.php

#### 数据库演示

>路径：sql/dilicms3.0.sql

#### 数据源

<table class="table table-sm table-bordered">
		<tbody><tr><td> <b>字段类型</b></td><td><b>数据源说明</b></td></tr><tr><td> 整形</td><td>不用设置 </td></tr><tr><td> 浮点型</td><td>不用设置 </td></tr><tr><td> 单行文本框</td><td>不用设置 </td></tr><tr><td>文本区域<br>
		<br>
		</td><td>不用设置</td></tr><tr><td>下拉菜单</td><td><font>设置如:“0=分类1|1=分类2”整型/字符串<br>
		<br>
		</font></td></tr><tr><td>单选按钮</td><td>设置如:“0=分类1|1=分类2”整型/字符串</td></tr><tr><td>复选框</td><td>设置如:“0=分类1|1=分类2”字符串</td></tr><tr><td>编辑器</td><td>不用设置</td></tr><tr><td>日期时间</td><td>不用设置</td></tr><tr><td>颜色选择器</td><td>不用设置</td></tr></tbody>
</table>

#### 示例url

>http://domainname.com/admin/index.php

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
 

