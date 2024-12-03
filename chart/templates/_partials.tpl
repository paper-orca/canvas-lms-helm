{{- define "canvas.container.image" -}}
image: "{{ .Values.image.repository }}:{{ .Values.image.tag | default .Chart.AppVersion }}"
imagePullPolicy: {{ .Values.image.pullPolicy }}
{{- end -}}

{{- define "canvas.container.common" -}}
{{ include "canvas.container.image" . }}
securityContext:
  {{- toYaml .Values.podSecurityContext | nindent 2 }}
resources:
  {{- toYaml .Values.resources | nindent 2 }}
volumeMounts:
  - name: config
    mountPath: /usr/src/app/config
  - name: brandablecss
    mountPath: /usr/src/app/public/dist/brandable_css
  - name: files
    mountPath: /usr/src/app/tmp/files
  - name: log
    mountPath: /usr/src/app/log
{{- with .Values.volumeMounts }}
  {{- toYaml . | nindent 2 }}
{{- end }}
envFrom:
  - configMapRef:
      name: {{ .Chart.Name }}
  - secretRef:
      name: {{ .Chart.Name }}
{{- end -}}
