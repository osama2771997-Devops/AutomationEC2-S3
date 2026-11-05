
#!/bin/bash

AMI_ID="ami-0d97d7f07b25dd693" # Amazon Linux 2 (for us-east-1)
INSTANCE_TYPE="t2.micro"
KEY_NAME="LearnDevopswithMiseacademy"  # Replace with your key
SECURITY_GROUP="launch-wizard-132"
INSTANCE_NAME="EC2WithS3Access2"


# Launch EC2 instance
INSTANCE_ID=$(aws ec2 run-instances \
  --image-id "$AMI_ID" \
  --instance-type "$INSTANCE_TYPE" \
  --key-name "$KEY_NAME" \
  --security-groups "$SECURITY_GROUP" \
  --tag-specifications "ResourceType=instance,Tags=[{Key=Name,Value=$INSTANCE_NAME}]" \
  --query "Instances[0].InstanceId" \
  --output text 2>/dev/null)

echo "✅ EC2 Instance Launched: $INSTANCE_NAME with id $INSTANCE_ID"
