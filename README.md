[![](https://images.microbadger.com/badges/image/aint/graalvm-native-image.svg)](https://microbadger.com/images/aint/graalvm-native-image)
[![](https://images.microbadger.com/badges/version/aint/graalvm-native-image.svg)](https://microbadger.com/images/aint/graalvm-native-image)
![Docker Pulls](https://img.shields.io/docker/pulls/aint/graalvm-native-image.svg?style=popout)

### GraalVM CE native-image as a docker container

https://hub.docker.com/r/aint/graalvm-native-image/

Provides a handy way to build native images for arbitrary JVM projects. Here is an example:

```bash
docker run -it -v $(pwd):/project --rm aint/graalvm-native-image \
  --verbose \
  -cp $CLASSPATH \
  -H:Name=app \
  -H:Class=$MAIN_CLASS \
  -H:+ReportUnsupportedElementsAtRuntime
```
