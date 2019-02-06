
```
helm dep update
helm install --name keycloak --namespace keycloak -f answers.yaml .
helm upgrade keycloak -f answers.yaml .
```
