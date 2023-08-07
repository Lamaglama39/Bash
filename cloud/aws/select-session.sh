#!/bin/bash

# Get InstanceID
get_instance_id_by_name() {
  local instance_name="$1"
  aws ec2 describe-instances \
    --filter "Name=tag-key,Values=Name" \
              "Name=tag-value,Values=$instance_name" \
    --query 'Reservations[*].Instances[*].InstanceId' \
    --output text
}

# Get Instance Name
get_instance_name_by_id() {
  local instance_id="$1"
  aws ec2 describe-instances \
      --instance-ids "$instance_id" \
      --query 'Reservations[*].Instances[].Tags[?Key==`Name`].Value' \
      --output text
}

# Get all InstanceID and NameTag
get_all_instances() {
  aws ssm describe-instance-information \
    --query 'InstanceInformationList[*].[InstanceId]' \
    --output text | while read -r id; do
        {
        name=$(get_instance_name_by_id "$id")
        echo "$name  $id"
        } &
      done
}

# main
case $# in
  1)
    InstanceID=$(get_instance_id_by_name "$1")
    aws ssm start-session --target "$InstanceID"
    ;;

  0)
    mapfile -t instances < <(get_all_instances | sort)
    PS3='Select Instance: '
    select instance in "${instances[@]}"; do
      [[ -n $instance ]] || continue
      InstanceID=$(echo "$instance" | awk '{print $2}')
      aws ssm start-session --target "$InstanceID"
      break
    done
    ;;

  *)
    echo "Error: Invalid number of arguments."
    echo "Usage1 Specify Name tag: $0 <NameTag>"
    echo "Usage2 Select from list: $0"
    exit 1
    ;;
esac
