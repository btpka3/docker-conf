
# 说明

安装 sonarqube 时需要检查插件版本，具体参考
[Plugin Version Matrix](https://docs.sonarqube.org/display/PLUG/Plugin+version+matrix)，
否则，可能会造成 sonarqube 无法启动。


# 插件 for SonarQube 5.6 LTS

* AEM Rules for SonarQube 

    该 [插件](https://github.com/Cognifide/AEM-Rules-for-SonarQube)
    是 Adobe 归纳的一些Java开发建议。
    
* Checkstyle
* Chinese Pack
* Cobertura
* CSS / LESS / SASS
* Findbugs
* Generic Coverage
* Github
* GitHub Authentication for SonarQube
* GitLab
* GitLab Auth
* Groovy
* jDepend
* Pitest
* PMD
* Rules Compliance Index (RCI)
* SonarJava
* SonarJS



#  postgresql 数据库初始化

```bash
psql -h localhost -U postgres postgres

DROP USER IF EXISTS sonar;
CREATE USER sonar PASSWORD 'sonar';

DROP DATABASE IF EXISTS sonar;
CREATE DATABASE sonar ENCODING = 'UTF-8';

ALTER DATABASE sonar OWNER TO sonar;

#ALTER USER sonar WITH SUPERUSER;
```
  
