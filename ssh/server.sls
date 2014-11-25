include:
  - ssh

openssh-server:
  pkg.installed

sshd:
  service.running
  - requrie:
    - pkg: openssh-client
    - pkg: openssh-server
    - file: /etc/ssh/banner
    - file: /etc/ssh/sshd_config

/etc/ssh/sshd_config
 file.managed:
   - user: root
   - group: root
   - mode: 644
   - source: salt://ssh/sshd_config
   - requrie:
     - pkg: openssh-server

/etc/ssh/banner
 file:
   - managed
   - user: root
   - group: root
   - mode: 644
   - source: salt://ssh/banner
   - requrie:
     - pkg: openssh-server

