# enforce use of gallium inside VMware
if /usr/sbin/lspci 2>/dev/null | grep -q 'VGA compatible controller: VMware'; then
  export EGL_PLATFORM=gallium EGL_DRIVER=egl_gallium
fi
