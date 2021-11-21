# role_name                           
ansible-role-cached

## Version
1.0.0

## Requirements
RPM based linux distro
If you setup the listen to 0.0.0.0 bare in mind that memcached doesn't provide authentication not authorization, firewall rules and se linux should be setup accordenly 


## Role Variables
memcached_port: 11211
memcached_user: "memcached"
memcached_maxconn: 8192
memcached_cachesize: 90188
memcached_listen: "0.0.0.0"
memcached_udpport: 0
memcached_threads: 8
memcached_loglevel: "-vv"
memcached_logfile: "/var/log/memcached.log"

## Dependencies

## Example Playbook

- name: "Setup memcached"
  hosts: memecacheservers
  tasks:
  - name: Build the memcached "cluster"
    vars:
      - memcached_port: 11211
      - memcached_user: "memcached"
      - memcached_maxconn: 8192
      - memcached_cachesize: 90188
      - memcached_listen: "0.0.0.0"
      - memcached_udpport: 0
      - memcached_threads: 8
      - memcached_loglevel: "-vv"
      - memcached_logfile: "/var/log/memcached.log
    include_role:
      name: ansible-role-ostack-component-builder
  become: True
    

## Testing
As of now the testing environment depends on virt-lightning, To be rewritten to use vagrant.
it needs to spin up 3 servers 


### Test environment for all operating systems

### How to run the role again
The role can be reaplies and will just adapt the new setting and be restarted

### Interactive debugging

## License
GPL

## Author Information
2021 Oct. Jakob Holst, jho@miracle.dk
