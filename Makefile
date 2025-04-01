
# HOW TO EXECUTE:
# - Ejecutar PLAN: make tf-plan env=dev
# - Ejecutar APPLY: make tf-apply env=dev
# - Ejecutar DESTROY: make tf-destroy env=dev



# Inicializa Terraform y valida la configuración
tf-init:
	terraform init 
	terraform validate

# Ejecuta plan, valida y formatea el código
tf-plan: 
	terraform plan 

# Aplica el plan generado
tf-apply:
	terraform apply -auto-approve 

# Destruye los recursos creados
tf-destroy:
	terraform destroy -auto-approve

# Muestra los outputs de Terraform
tf-output:
	terraform output

