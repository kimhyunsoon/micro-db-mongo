source ./scripts/config

# 유저에 따라 기준 디렉토리 설정
if [ "$OS_USER" = "root" ]; then
  dir="/root"
else
  dir="/home/$OS_USER"
fi

# 디렉토리 확인
if [ -d "$dir" ]; then
  # nfs 디렉토리가 없을 경우 생성
  if [ ! -d "$dir/nfs" ]; then
    mkdir "$dir/nfs"
  fi
  # nfs/micro-mongo 디렉토리가 없을 경우 생성
  if [ ! -d "$dir/nfs/micro-mongo" ]; then
    mkdir "$dir/nfs/micro-mongo"
    mkdir "$dir/nfs/micro-mongo/data"
  fi

  # 기존 컨테이너 삭제
  docker container rm -f micro-mongo
  # 빌드
  docker build --tag micro-mongo .
  # 실행
  docker run -d \
    -p $OUTER_PORT:27017 \
    --name micro_mongo \
    -v $dir/nfs/micro-mongo/data:/data/db \
    micro-mongo
else
    echo "config 파일의 LINUX 유저명을 확인해주세요."
fi
