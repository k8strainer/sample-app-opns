oc new-project sample-app
oc create sa sample-app-admin -n sample-app
oc create clusterrolebinding sample-app-admin-binding \
  --clusterrole=cluster-admin --serviceaccount=sample-app:sample-app-admin 

# create token for 5 days
oc create token sample-app-admin -n sample-app --duration=432000s > sample-app-admin-token.txt
oc create secret generic sample-app-admin-secret -n sample-app  --from-file=bearerToken=sample-app-admin-token.txt

 
