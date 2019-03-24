#!/bin/bash
set -euo pipefail

ansible-galaxy install -p roles -r rolesfile.yml
ansible-playbook \
  -vvv \
  -i inventory/hosts \
  roles/openshift-ansible/playbooks/prerequisites.yml
ansible-playbook \
  -vvv \
  -i inventory/hosts \
  roles/openshift-ansible/playbooks/deploy_cluster.yml
