mkdir -p ./source

if [ -f "./source/windows-server-2022.iso" ]; then
    echo "windows-server-2022.iso already exists. Skipping..."
else
   echo "Downloading windows-server-2022.iso..."
   curl https://software-download.microsoft.com/download/sg/20348.169.210806-2348.fe_release_svc_refresh_SERVER_EVAL_x64FRE_en-us.iso -o ./source/windows-server-2022.iso -L -#
  #https://software-static.download.prss.microsoft.com/sg/download/888969d5-f34g-4e03-ac9d-1f9786c66749/SERVER_EVAL_x64FRE_en-us.iso
fi

if [ -f "./source/windows-server-2019.iso" ]; then
    echo "windows-server-2019.iso already exists. Skipping..."
else
  echo "Downloading windows-server-2019.iso..."
  curl https://software-static.download.prss.microsoft.com/pr/download/17763.737.190906-2324.rs5_release_svc_refresh_SERVER_EVAL_x64FRE_en-us_1.iso -o ./source/windows-server-2019.iso -L -#
fi

if [ -f "./source/virtio-win.iso" ]; then
    echo "virtio-win.iso already exists. Skipping..."
else
  echo "Downloading virtio-win.iso..."
  curl https://fedorapeople.org/groups/virt/virtio-win/direct-downloads/stable-virtio/virtio-win.iso -o ./source/virtio-win.iso -L -#
fi
