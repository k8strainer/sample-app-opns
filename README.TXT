Fügen Sie die folgende RBACs hinzu, sonst kann openshift-gitops
die app nicht im Zielnamespace anlegen!
oc adm policy add-role-to-user admin system:serviceaccount:openshift-gitops:openshift-gitops-argocd-application-controller -n sample-app
oc adm policy add-role-to-user monitoring-edit system:serviceaccount:openshift-gitops:openshift-gitops-argocd-application-controller -n sample-app
# 2. RBAC ebenfalls nötig, sonst fehler beim erzeugen des ServiceMonitors
