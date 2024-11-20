{{- define "canvas.container.common" -}}
securityContext:
  {{- toYaml .Values.securityContext | nindent 2 }}
image: "{{ .Values.image.repository }}:{{ .Values.image.tag | default .Chart.AppVersion }}"
imagePullPolicy: {{ .Values.image.pullPolicy }}
resources:
  {{- toYaml .Values.resources | nindent 2 }}
volumeMounts:
  - name: config
    mountPath: /usr/src/app/config
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
