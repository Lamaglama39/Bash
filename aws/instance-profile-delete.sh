#!/bin/bash

instance_profiles=$(aws iam list-instance-profiles --query "InstanceProfiles[*].InstanceProfileName" --output text)

for profile_name in $instance_profiles; do
  echo "$profile_name"
  aws iam delete-instance-profile \
    --instance-profile-name "$profile_name"
done

