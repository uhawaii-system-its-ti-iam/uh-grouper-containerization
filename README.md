# Build

## Requirements

1. java 8. Note that at this time only version 8 is supported (less than 8 has been deprecated; later than 8 is planned
for later)
2. git. This isn't strictly required, but will make further development easier

## Build

On Mac/Linux:
```
git clone git@rep11.pvt.hawaii.edu:iam-developers/hawaii-grouper.git
cd hawaii-grouper
./gradlew clean dockerTag
```

On Windows:
```
git clone git@rep11.pvt.hawaii.edu:iam-developers/hawaii-grouper.git
cd hawaii-grouper
.\gradlew.bat clean dockerTag
```

This will build new images with versions corresponding to the version of grouper and the current timestamp (UTC). For
instance:

```
PS C:\Users\jj-unicon\t2\hawaii-grouper> docker image ls                                                                
REPOSITORY                             TAG                     IMAGE ID            CREATED             SIZE
hawaii/grouper-ws                      2.5.27-20200513200641   c7ae723342f0        34 seconds ago      538MB
hawaii/grouper-ws                      latest                  c7ae723342f0        34 seconds ago      538MB
localhost:5000/hawaii/grouper-ws       2.5.27-20200513200641   c7ae723342f0        34 seconds ago      538MB
localhost:5000/hawaii/grouper-ws       latest                  c7ae723342f0        34 seconds ago      538MB
hawaii/grouper-ui                      2.5.27-20200513200641   f7c06257df02        37 seconds ago      554MB
hawaii/grouper-ui                      latest                  f7c06257df02        37 seconds ago      554MB
localhost:5000/hawaii/grouper-ui       2.5.27-20200513200641   f7c06257df02        37 seconds ago      554MB
localhost:5000/hawaii/grouper-ui       latest                  f7c06257df02        37 seconds ago      554MB
hawaii/grouper-daemon                  2.5.27-20200513200641   33e2fb62ca7c        50 seconds ago      498MB
hawaii/grouper-daemon                  latest                  33e2fb62ca7c        50 seconds ago      498MB
localhost:5000/hawaii/grouper-daemon   2.5.27-20200513200641   33e2fb62ca7c        50 seconds ago      498MB
localhost:5000/hawaii/grouper-daemon   latest                  33e2fb62ca7c        50 seconds ago      498MB
```

# Running

For example configuration, see `src/test/docker/docker-compose.yml`.

All images require the following environment variables to run:

* JDBC_URL
* JDBC_USERNAME
* JDBC_PASSWORD
* ENCRYPT_KEY

Additionally, the `ui` image can use the following:

* PAC4J_ENABLED
* PAC4J_GROUPERCONTEXTURL
* GROUPERUI_CONFIGURATIONEDITOR_SOURCEADDRESSES (note that this one will change in the future as there's now a standard
grouper variable)

example:

```
podman run -d --rm --privileged \
    --name grouper_ui \
    -p "8443:8443" \
    -e JDBC_URL="jdbc:mysql://mdb64.pvt.hawaii.edu:3306/grprscratch?CharSet=utf8&useUnicode=true&characterEncoding=utf8&useSSL=false" \
    -e JDBC_PASSWORD="grouper_password" \
    -e JDBC_USERNAME="grpr_admin" \
    -e PAC4J_ENABLED="true" \
    -e PAC4J_GROUPERCONTEXTURL="https://grp73.pvt.hawaii.edu/grouper" \
    -e ENCRYPT_KEY="somethingreallysecret" \
    -e GROUPERUI_CONFIGURATIONEDITOR_SOURCEADDRESSES="0.0.0.0/32" \
    hawaii/grouper-ui:2.5.23-20200505200930
```