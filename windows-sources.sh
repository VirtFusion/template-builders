mkdir -p ./source

if [ -f "./source/windows-server-2022-eval.iso" ]; then
    echo "windows-server-2022-eval.iso already exists. Skipping..."
else
   echo "Downloading windows-server-2022-eval.iso..."
   curl https://software-download.microsoft.com/download/sg/20348.169.210806-2348.fe_release_svc_refresh_SERVER_EVAL_x64FRE_en-us.iso -o ./source/windows-server-2022-eval.iso -L -#
 fi

if [ -f "./source/windows-server-2019-eval.iso" ]; then
    echo "windows-server-2019-eval.iso already exists. Skipping..."
else
  echo "Downloading windows-server-2019-eval.iso..."
  curl https://software-static.download.prss.microsoft.com/pr/download/17763.737.190906-2324.rs5_release_svc_refresh_SERVER_EVAL_x64FRE_en-us_1.iso -o ./source/windows-server-2019-eval.iso -L -#
fi

if [ -f "./source/virtio-win.iso" ]; then
    echo "virtio-win.iso already exists. Skipping..."
else
  echo "Downloading virtio-win.iso..."
  curl https://fedorapeople.org/groups/virt/virtio-win/direct-downloads/archive-virtio/virtio-win-0.1.248-1/virtio-win.iso -o ./source/virtio-win.iso -L -#
fi
