source ./scripts/config

# 디렉토리 확인
if [ -d "$NFS_DIR" ]; then

  # nfs 디렉토리가 없을 경우 생성
  if [ ! -d "$NFS_DIR" ]; then
    mkdir "$NFS_DIR"
  fi

  # nfs/micro-mongo 디렉토리가 없을 경우 생성
  if [ ! -d "$NFS_DIR/micro-mongo" ]; then
    mkdir "$NFS_DIR/micro-mongo"
    mkdir "$NFS_DIR/micro-mongo/data"
  fi

  # 기존 컨테이너 삭제
  docker container rm -f micro-mongo

  # 빌드
  docker build --tag micro-mongo .

  # 실행
  docker run -d \
    -p $OUTER_PORT:27017 \
    --name micro-mongo \
    -v $NFS_DIR/micro-mongo/data:/data/db \
    -v $NFS_DIR/micro-mongo/backups:/etc/backups \
    -v $NFS_DIR/micro-mongo/log:/var/log/mongodb \
    micro-mongo

else
    echo "config 파일의 NFS_DIR을 확인해주세요."
fi
