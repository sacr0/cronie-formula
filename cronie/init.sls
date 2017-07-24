{% from "cronie/map.jinja" import cronie with context %}

# install package and run servie
cronie:
  pkg.installed:
    - name: {{ cronie.pkg }}
  service.running:
    - enable: True
    - name: {{ cronie.service }}
