
## set up

- aws-cli
- jq


## global

リージョンの一覧

aws ec2 describe-regions | jq '.Regions [] .RegionName


## アマゾンのAMI一覧

### 全て（結構な量）

aws ec2 describe-images --owners self amazon

### imageIdとNameのみ

aws ec2 describe-images --owners self amazon | jq '.Images []' | jq '{Name, ImageId}'

### describe a specific AMI（from ID）

aws ec2 describe-images --image-ids ami-4985b048

(this ami is 2014-10 Amazon Linux)

## インスタンスの作成

aws ec2 run-instances --image-id ami-4985b048 --count 1 --instance-type t2.micro --key-name my_key --security-group-ids sg-XXX --subnet subnet-XXX

## インスタンスの確認

### 全体の確認（簡易）

aws ec2 describe-instances | jq '.Reservations [] .Instances []' | jq '{State, Tags, InstanceId}'

### 詳細の確認（from ID）

aws ec2 describe-instances --instance-ids i-XXX | jq '.Reservations [] .Instances []'


### インスタンスの起動・停止・終了

起動

aws ec2 start-instances --instance-ids i-XXX

停止 stop

aws ec2 stop-instances --instance-ids i-XXX

終了 terminate

aws ec2 terminate-instances --instance-ids i-XXX

### tagの作成

aws ec2 create-tags --resources ami-XXX i-XXX --tags Key=webserver,Value=   Key=stack,Value=Production

### 状態監視

describe-instance-status
