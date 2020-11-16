#/bin/sh

# API_SERVER="API_SERVER_URL_CHANGE_ME"

### RHPDS - CCNRD WORKSHOP instance
TARGET_HOST="BASTION_HOST_CHANGE_ME"
OCP_USERNAME="opentlc-mgr"
#OCP_PASSOWRD="CHANGE_ME"
WORKLOAD="ocp4-workload-ccnrd-fsi-overlay"
GUID="GUIDE_CHANGE_ME"
ACTION="create"

ANSIBLE_SSH_USER="BASTION_USER_CHANGE_ME"
ANSIBLE_SSH_PWD="BASTION_PASSWORD_CHANGE_ME"

NUM_USERS="30"
MODULE_TYPE="m1;m3"

#oc login "${API_SERVER}" -u "${OCP_USERNAME}" -p "${OCP_PASSOWRD}" --insecure-skip-tls-verify=true

# change dir to agnosticd/ansible folder
cd ../../

# execute ansible-playbook for the specific AgnosticD workload 
ansible-playbook -i ${TARGET_HOST}, ./configs/ocp-workloads/ocp-workload.yml \
    -e @./roles/${WORKLOAD}/defaults/main.yml \
    -e"num_users=${NUM_USERS}" \
    -e"module_type=${MODULE_TYPE}" \
    -e"ocp_username=${OCP_USERNAME}" \
    -e"ocp_workload=${WORKLOAD}" \
    -e"silent=False" \
    -e"ACTION=${ACTION}" \
    -e"ansible_user=${ANSIBLE_SSH_USER}" \
    -e"ansible_password=${ANSIBLE_SSH_PWD}" \
    -e"guid=${GUID}"
