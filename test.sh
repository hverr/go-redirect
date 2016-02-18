docker run -d -p 80:80 "$DOCKER_USER"/go-ssl-redirect:$TRAVIS_TAG
output=`curl localhost/test`
if [ "$output" = '<a href="https://localhost/test">Found</a>.' ]; then
  echo redirect successful
  exit 0
else
  echo redirect failed
  exit 1
fi
