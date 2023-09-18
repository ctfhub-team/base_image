#!/bin/bash

do_build() {
    docker-compose build
}
do_start() {
    docker-compose up -d
}
do_stop()  {
    docker-compose down
}
do_bash()  {
    docker-compose exec challenge bash
}
do_sh()    {
    docker-compose exec challenge sh
}
do_help() {
    echo "CTFHub测试脚本"
    echo "run.sh [test|build|start|stop|bash|sh|help]"
    echo "+-------+----------------------------------+"
    echo "| test  | 依次执行stop->build->start->bash |"
    echo "| build | 构建环境                         |"
    echo "| start | 启动环境                         |"
    echo "| stop  | 停止环境                         |"
    echo "| bash  | 执行bash进入Docker内部           |"
    echo "| sh    | 执行sh进入Docker内部             |"
    echo "| help  | 打印本消息                       |"
    echo "+-------+----------------------------------+"
    echo ""
    echo "For Example: ./run.sh test"
}

case "$1" in
    test)
        do_stop
        do_build
        do_start
        do_bash
        ;;
    build)
        do_build
        ;;
    start)
        do_start
        ;;
    stop)
        do_stop
        ;;
    bash)
        do_bash
        ;;
    sh)
        do_sh
        ;;
    *)
        do_help
        ;;
esac
exit 0