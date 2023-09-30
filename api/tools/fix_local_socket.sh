MODE=${MODE:-prod}
GVM_USER=${GVM_USER:-gvm}
GVM_PASS=${GVM_PASS:-gvm}
GVM_REMOTE_SOCKET_PATH=${GVM_REMOTE_SOCKET_PATH:-/gvm_socket}
GVM_LOCAL_SOCKET_PATH=${GVM_LOCAL_SOCKET_PATH:-/vaaas}

echo "Deleting gvmd.sock file..."
rm -rf /vaaas/gvmd.sock

echo "Re-creating loca; API socket"
while ! sshpass -p $GVM_PASS ssh -o StreamLocalBindUnlink=yes -o StreamLocalBindMask=0111 -o UserKnownHostsFile=/dev/null -o \
                  StrictHostKeyChecking=no -f -nNT -L $GVM_LOCAL_SOCKET_PATH/gvmd.sock:$GVM_REMOTE_SOCKET_PATH/gvmd.sock $GVM_USER@vaaas; do
  echo "-----------------------------sleeping - creating local socket"
  sleep 60
done
echo " waiting for the socket to be created.......(30s)"
sleep 30
