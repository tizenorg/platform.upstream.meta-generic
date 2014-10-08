do_gallium=true

/usr/sbin/lspci \
  | grep 'VGA compatible controller: VMware' >/dev/null 2>&1 \
  || do_gallium=false

if $do_gallium ; then
  EGL_PLATFORM=gallium
  export EGL_PLATFORM

  EGL_DRIVER=egl_gallium
  export EGL_DRIVER
fi
