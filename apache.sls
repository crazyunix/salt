apache:
    pkg:
    - installed
    service:
    - running
    - watch:
      - pkg: apache
      - file: /etc/
