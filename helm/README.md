# Helm

Helm is a package manager for Kubernetes. We use two of it's features:

- Generating YAML files from templates
- Having charts that require other charts for Gitops

## Templates

Instead of having YAML files, Helm uses YAML _templates_.  A YAML template file looks like this:

```yaml
apiVersion: v1
kind: Service
metadata:
  name: {{ include "starter-kit.fullname" . }}
  labels:
    app.kubernetes.io/name: {{ include "starter-kit.name" . }}
    helm.sh/chart: {{ include "starter-kit.chart" . }}
    app.kubernetes.io/instance: {{ .Release.Name }}
    app: {{ .Release.Name }}
spec:
  type: {{ .Values.service.type }}
  ports:
    - port: {{ .Values.service.port }}
      targetPort: {{ .Values.image.port }}
      protocol: TCP
      name: http
  selector:
    app.kubernetes.io/name: {{ include "starter-kit.name" . }}
    app.kubernetes.io/instance: {{ .Release.Name }}
```

Then there's a file named `values.yaml`

```
helm template <release-name> ./chart/base
```
