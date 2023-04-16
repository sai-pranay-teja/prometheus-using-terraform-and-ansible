git:
	terraform destroy -var-file=env-practise/main.tfvars -auto-approve
	rm -rf terraform* .terraform*
	git pull

apply: git
	terraform init
	terraform apply -var-file=env-practise/main.tfvars -auto-approve

destroy:
	terraform destroy -var-file=env-practise/main.tfvars -auto-approve