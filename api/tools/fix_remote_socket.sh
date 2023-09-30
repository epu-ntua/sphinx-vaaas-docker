MODE=${MODE:-prod}
GVM_USER=${GVM_USER:-gvm}
GVM_PASS=${GVM_PASS:-gvm}
GVM_REMOTE_SOCKET_PATH=${GVM_REMOTE_SOCKET_PATH:-/gvm_socket}
GVM_LOCAL_SOCKET_PATH=${GVM_LOCAL_SOCKET_PATH:-/vaaas}

echo "fixing remote gvmd socket on VAAAS"
echo ".......Deleting remote GVMD socket....."
while ! sshpass -p "gvm" ssh -o StreamLocalBindUnlink=yes -o StreamLocalBindMask=0111 -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no $GVM_USER@vaaas "rm -rf $GVM_REMOTE_SOCKET_PATH/gvmd.sock"; do
  echo "..........ERROR could NOT create GVMD socket....retrying in 60 seconds..........................."
  sleep 60
  # your file exists
done
echo "-----------------------------SUCCESS  deleted remote GVMD socket on VAAAS!!"

echo "creating gvmd socket on VAAAS"
while ! sshpass -p "gvm" ssh -o StreamLocalBindUnlink=yes -o StreamLocalBindMask=0111 -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no $GVM_USER@vaaas "gvmd --unix-socket=$GVM_REMOTE_SOCKET_PATH/gvmd.sock"; do
  echo "..........ERROR could NOT create GVMD socket....retrying in 60 seconds..........................."
  sleep 60
  # your file exists
done
echo "-----------------------------SUCCESS  created GVMD socket on VAAAS!!"
