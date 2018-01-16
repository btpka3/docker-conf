


```bash
mkdir -p /data0/store/soft/gitlab/logs
mkdir -p /data0/store/soft/gitlab/data
/srv/gitlab/data


docker pull gitlab/gitlab-ce:9.2.1-ce.0

docker create \
    --name my-gitlab \
    --hostname gitlab.example.com \
    --publish 1801:443 \
    --publish 1800:80 \
    --publish 1808:22 \
    --restart always \
    --volume /data0/conf/soft/gitlab/test14/conf:/etc/gitlab \
    --volume /data0/store/soft/gitlab/logs:/var/log/gitlab \
    --volume /data0/store/soft/gitlab/data:/var/opt/gitlab \
    gitlab/gitlab-ce:9.2.1-ce.0


docker start my-gitlab
docker cp my-gitlab:/etc/gitlab/gitlab.rb /tmp/
```


# 参考

* [GitLab Docker images](https://docs.gitlab.com/omnibus/docker/)
* [gitlab@Docker hub](https://hub.docker.com/r/gitlab/gitlab-ce/tags/)



