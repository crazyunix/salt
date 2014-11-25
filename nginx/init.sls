nginx:
  - pkg: installed
  service:
    - running
    - enable: True
    - reload: True
    - require:
      - pkg: installed
    - watch:
      - pkg: nginx
      - file: /etc/nginx/nginx.conf
      - file: /etc/nginx/conf.d/
      - user: www-data
  user.present:
    - uid: 33
    - gid: 33
    - home: /home/www-data
    - shell: /bin/nologin
    - require:
      - group: www-data

  group.present:
    - gid: 33
    - require:
      - pkg: nginx

/etc/nginx/nginx.conf
  file.managed:
    - source: salt://nginx/conf/nginx.conf
    - user: root
    - group: root
    - mode: 644
/etc/nginx/conf.d/:
  file.recurese:
    - source: salt://nginx/conf.d/
    - user: root
    - group: root
    - file_mode: 644
    - dir_mode: 755
