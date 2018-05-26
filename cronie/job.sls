include:
  - cronie

{% for description, setting in salt['pillar.get']('cron:job', {}).iteritems() %}
cron_{{ description }}:
  cron.{{ setting.get('state','present') }}:
  {%- for variable, value in setting.iteritems() %}
    - {{variable}}: '{{value}}'
  {%- endfor %}
    - require:
      - service: cronie
  
  
  
  
    - name: "{{ setting.get('script','') }}"
    - user: "{{ setting.get('user','root') }}"
    - comment: "rsync backup for {{ datadesc }}"
    - identifier: backup_rsync_{{ datadesc }}
    {%- for variable, value in setting.get('cron_settings',{}).iteritems() %}
    - {{variable}}: '{{value}}'
    {%- endfor %}
    - require:
      - service: cronie
{% endfor %}