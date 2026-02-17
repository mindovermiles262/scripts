#!/usr/bin/env bash

if [ $# -ne 1 ]; then
  echo "Usage: $0 <InstanceID>"
  exit 1
fi

aws cloudwatch get-metric-statistics \
  --namespace AWS/EC2 \
  --metric-name NetworkOut \
  --dimensions Name=InstanceId,Value="$1" \
  --start-time 2025-01-01T00:00:00Z \
  --end-time 2025-02-01T00:00:00Z \
  --period 2678400 \
  --statistics Sum \
  --region us-east-1 \
  --profile lr-production
