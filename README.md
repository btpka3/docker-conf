


## setup

```bash
mkdir /data0
cd /data0
git clone git@github.com:btpka3/docker-conf.git conf
```




## 目录结构设计

```text
/data0

    # 配置文件区 —— 当前仓库检出根目录，
    /conf     
        /app
            /${appProjectName}/${appName}/${profile}
                /setup.sh
                /scp.sh
                /deploy.sh
                /work/                                      # 解压并执行时的解压目录（工作目录）
                /work/config/application-${profile}.yml     # APP 配置文件
                /docker/start.sh                            # docker 容器内的服务启动脚本
        /soft
            /${softName}/${hostAlias}/
        /host
            /${hostAlias}

    # 数据存储区
    /store
        /app
            /${appProjectName}/${appName}
                /logs                                       # 日志区域
        /soft
            /${softName}/
                /logs                                       # 日志区域
                /xxx                                        # 其他内容        

    # 可执行程序区（将来可以使用 docker 替换）
    /exe  
        /app/
            /${appProjectName}/${appName}
                /bak                                        # 可执行程序的备份区域
                /html                                       # 前端工程的HTML 目录
                /upload                                     # 上传的可执行文件区域
                
        /soft/
            /${softName}/${softFullName}
                /xxxx                                       # 文件执行程序

    /work                                                   # 仅限开人员本地使用
        /git-repo/${repoProviderName}/${repoOwner}/${repo}
    
```



说明：
1. "/data0" 目录一般要挂载独立的的硬盘（或分区），不能直接放到系统分区中。
1. "app" 目录存放 IT 团队自己研发的程序
1. "soft" 目录存放第三方程序。比如（nginx等）

