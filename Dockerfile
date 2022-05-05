FROM alpine
ADD pb-demo /pb-demo
ENTRYPOINT [ "/pb-demo" ]
