#!/usr/bin/env bash
set -Eeuo pipefail

MODE=${MODE:-prod}
GVMD_USER=${GVMD_USER:-gvm}
GVMD_PASS=${GVMD_PASS:-gvm}
GVMD_REMOTE_PATH=${GVMD_REMOTE_PATH:-/data/gvmd}
GVMD_LOCAL_PATH=${GVMD_LOCAL_PATH:-/vaaas}
#service ssh restart
#sshpass -p root ssh -nNT -L /home/vaaas/gvmd.sock:/usr/local/var/run/gvmd.sock root@vaaas

#chmod a+r+w /vaaas/gvmd.sock

#killall ssh
echo "fixing sshd_config file..."
if [ ! -f "/etc/ssh/sshd_config" ]; then
  cp /sshd_config /etc/ssh/sshd_config
else
  rm /etc/ssh/sshd_config
  cp /sshd_config /etc/ssh/sshd_config
fi
/etc/init.d/ssh restart

#echo "creating gvmd socket on VAAAS"
#while ! sshpass -p "gvm" ssh -o StreamLocalBindUnlink=yes -o StreamLocalBindMask=0111 -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no $GVM_USER@vaaas "gvmd --unix-socket=$GVM_REMOTE_SOCKET_PATH/gvmd.sock"; do
#  echo "..........ERROR could NOT create GVMD socket....retrying in 60 seconds..........................."
#  sleep 60
#  # your file exists
#done
#echo "-----------------------------SUCCESS  created GVMD socket on VAAAS!!"

#echo "-----------------------------Checking if GVMD works...."
#while ! sshpass -p "gvm" ssh -o StreamLocalBindUnlink=yes -o StreamLocalBindMask=0111 -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no $GVMD_USER@vaaas "gvmd --version"; do
#  echo "sleeping - Checking if GVMD works"
#  sleep 60
#  # your file exists
#done
#echo "-----------------------------GVMD Worksss!!"

echo "Checking if gvmd.sock Exists on VAAAS"
#while ! sshpass -p "gvm" ssh -o StreamLocalBindUnlink=yes -o StreamLocalBindMask=0111 -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no $GVM_USER@vaaas "test -e $GVM_REMOTE_SOCKET_PATH/gvmd.sock"; do
while ! sshpass -p "gvm" ssh -o StreamLocalBindUnlink=yes -o StreamLocalBindMask=0111 -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no $GVMD_USER@vaaas "test -e $GVMD_REMOTE_PATH/gvmd.sock"; do
  echo "sleeping - Check if gvmd.sock Exists"
  sleep 60
  # your file exists
done
echo "-----------------------------GVM Socket (gvmd.sock) Existss on VAAAS!!"

#while ! curl -I -k http://vaaas:9392; do
#  echo "-----------------------------sleeping - curl https://vaaas:9392"
#  sleep 60
#done
#echo "Connected!"
# RUN python script
## shellcheck disable=SC2164
#echo "-----------------------------Deleting local gvmd.sock file if exists..."
#if [ -f "/vaaas/gvmd.sock" ]; then
#  echo "/vaaas/gvmd.sock exists!. Deleting..."
#  rm /vaaas/gvmd.sock
#else
#  echo "/vaaas/gvmd.sock does NOT exists!"
#fi
#
#echo "-----------------------------creating local socket..."
##while ! sshpass -p $GVM_PASS ssh -o StreamLocalBindUnlink=yes -o StreamLocalBindMask=0111 -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no -f -nNT -L /vaaas/gvmd.sock:/usr/local/var/run/gvmd.sock $GVM_USER@vaaas; do
#while ! sshpass -p $GVMD_PASS ssh -o StreamLocalBindUnlink=yes -o StreamLocalBindMask=0111 -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no -f -nNT -L $GVMD_LOCAL_PATH/gvmd.sock:$GVMD_REMOTE_PATH/gvmd.sock $GVMD_USER@vaaas; do
#  echo "-----------------------------sleeping - creating local socket"
#  sleep 60
#done
#echo " waiting for the socket to be created.......(30s)"
#sleep 30
#
#if [ ! -S /vaaas/gvmd.sock ]; then
#  echo "---------ERROR-------------- socket does not exist!!!! ---------------------ERROR------------------------"
#  exit
#fi
#
#echo "/vaaas/gvmd.sock CREATED!..."
##chmod a+rwx /vaaas/gvmd.sock

cd /vaaas
python3 -m pip install sanic Sanic-Cors sanic-openapi python-gvm xmltodict PyPubSub
python3 main.py $MODE
echo "API started......."
