include:
  - cronie

{% for description, setting in salt['pillar.get']('cronie:job', {}).items() %}
cron_{{ description }}:
  cron.{{ setting.get('state','present') }}:
  {%- for variable, value in setting.items() %}
    - {{variable}}: '{{value}}'
  {%- endfor %}
    - require:
      - service: cronie
{% endfor %}