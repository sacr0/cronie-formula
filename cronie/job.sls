include:
  - cronie

{% for description, setting in salt['pillar.get']('cronie:job', {}).iteritems() %}
cron_{{ description }}:
  cron.{{ setting.get('state','present') }}:
  {%- for variable, value in setting.iteritems() %}
    - {{variable}}: '{{value}}'
  {%- endfor %}
    - require:
      - service: cronie
{% endfor %}