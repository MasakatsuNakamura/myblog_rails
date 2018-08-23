クラスタ作成
ecs-cli up --launch-type FARGATE --azs ap-northeast-1a,ap-northeast-1c

起動コマンド
ecs-cli compose --project-name my-project --cluster default service up --launch-type FARGATE --timeout 3600
