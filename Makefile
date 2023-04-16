git:
	rm -rf terraform* .terraform*
	git pull

terraform-apply: git
	terraform init
	terraform apply -var-file=env-practise/main.tfvars -auto-approve

terraform-destroy:
	terraform destroy -var-file=env-practise/main.tfvars -auto-approve