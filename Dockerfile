FROM scratch
MAINTAINER Henri Verroken <henriverroken@gmail.com>

ADD go-redirect go-redirect

EXPOSE 80

CMD [ "/go-redirect" ]
