### 적용 방법
1. `./scripts/config` 파일 작성 (아래 config 예시 참고)
2. `bash run.sh` 실행
3. Docker 컨테이너에 접속하여 `init.sh` 실행

### Config 예시
```bash
OS_USER=$서버유저명
OUTER_HOST=$외부IP
OUTER_PORT=$외부포트
DB_ROOT_NAME=root
DB_ROOT_PASSWORD=$비밀번호
DB_MASTER_NAME=master
DB_MASTER_PASSWORD=$비밀번호
DB_DATABASE_NAME=$데이터베이스명
