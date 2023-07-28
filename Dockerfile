FROM mongo:6.0

# 데이터베이스 폴더 생성
RUN mkdir -p /data/db

# 스크립트+설정 파일 복사 (실행은 컨테이너 접속 후 수동실행)
COPY ./scripts/ .

# 몽고디비 실행
CMD mongod --bind_ip_all --replSet rs --port 27017
