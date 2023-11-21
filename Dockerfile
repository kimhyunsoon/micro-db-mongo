FROM mongo:6.0

# 데이터베이스 폴더 생성
RUN mkdir -p /data/db

# 스크립트+설정 파일 복사 (실행은 컨테이너 접속 후 수동실행)
COPY ./scripts/ .

# 키파일 복사
COPY ./mongodb.key /mongodb.key

# 키 파일 권한 설정
RUN chmod 600 /mongodb.key

# 설정파일 복사
COPY ./mongod.conf /etc/mongod.conf

# 몽고디비 실행
CMD mongod -f /etc/mongod.conf