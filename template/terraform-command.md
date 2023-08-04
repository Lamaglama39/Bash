# check code format
terraform fmt -recursive -check

# validate
terraform validate

# validate to all directory
find . -type f -name '*.tf' -exec dirname {} \; | sort -u | xargs -I {} terraform validate {}

# validation to autocomplete
terraform -install-autocomplete

# Enable plugin cache
echo 'plugin_cache_dir = "$HOME/.terraform.d/plugin-cache"' >> .terraformrc

# Detects malicious code
tflint

# increase in speed
export TF_CLI_ARGS_plan="-parallelism=20"
export TF_CLI_ARGS_apply="-parallelism=20"
export TF_CLI_ARGS_destroy="-parallelism=20"

# debug log
TF_LOG=debug terraform apply
TF_LOG=debug TF_LOG_PATH=/tmp/terraform.log terraform apply
