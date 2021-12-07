{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "sysadvent2021.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/* Common labels */}}
{{- define "sysadvent2021.labels" -}}
helm.sh/chart: {{ include "sysadvent2021.chart" . | quote }}
app.kubernetes.io/managed-by: {{ .Release.Service | quote }}
app.kubernetes.io/name: {{ .Release.Name | quote }}
app.kubernetes.io/app-version: {{ .Chart.AppVersion | quote }}
app.kubernetes.io/part-of: {{ .Release.Name | quote }}
app.kubernetes.io/namespace: {{ .Release.Namespace | quote }}
{{- end }}


{{/* 
Return the version of the app to be deployed 
*/}}
{{- define "sysadvent2021.appVersion" -}}
{{- printf "%s" .Values.version | default .Chart.AppVersion -}}
{{- end }}
