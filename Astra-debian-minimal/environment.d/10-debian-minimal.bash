export DISTRO_HOSTNAME=astralinux
export DISTRO_NAME=debian
export DIB_RELEASE=${DIB_RELEASE:-stable}
export DIB_INIT_SYSTEM=systemd
export EFI_BOOT_DIR="EFI/debian"

if [ -n "${DIB_DEBIAN_DISTRIBUTION_MIRROR:-}" ]; then
    DIB_DISTRIBUTION_MIRROR=$DIB_DEBIAN_DISTRIBUTION_MIRROR
fi
export DIB_DISTRIBUTION_MIRROR=${DIB_DISTRIBUTION_MIRROR:- http://192.168.1.3:8080 }
#export DIB_DISTRIBUTION_MIRROR=${DIB_DISTRIBUTION_MIRROR:-http://deb.debian.org/debian}

# With Debian, security is in a different repository.  We can't, say,
# assume "${DIB_DISTRIBUTION_MIRROR}-security" is valid.  The only
# choice is for people to add it separately, otherwise we use
# upstream.
DIB_DEBIAN_SECURITY_MIRROR=${DIB_DEBIAN_SECURITY_MIRROR:-http://security.debian.org/}

export DIB_DEBIAN_COMPONENTS=${DIB_DEBIAN_COMPONENTS:-main}
export DIB_DEBIAN_COMPONENTS_WS=${DIB_DEBIAN_COMPONENTS//,/ }

case "${DIB_RELEASE}" in
  bookworm|bullseye|stable|testing)
    DIB_DEBIAN_SECURITY_PATH="${DIB_RELEASE}-security"
    DIB_DEBIAN_SECURITY_SUBPATH=${DIB_DEBIAN_SECURITY_SUBPATH:-}
    ;;
  *)
    DIB_DEBIAN_SECURITY_PATH="${DIB_RELEASE}"
    DIB_DEBIAN_SECURITY_SUBPATH=${DIB_DEBIAN_SECURITY_SUBPATH:-/updates}
    ;;
esac

#DIB_APT_SOURCES_CONF_DEFAULT=\
#"deb [trusted=yes] http://192.168.1.3:8080 smolensk main
#"

DIB_APT_SOURCES_CONF_DEFAULT=\
"deb [trusted=yes] $DIB_DISTRIBUTION_MIRROR smolensk main
"

if [ "${DIB_RELEASE}" = "testing" -o "${DIB_RELEASE}" = "unstable" ]; then
    DIB_APT_SOURCES_CONF_DEFAULT="default:deb ${DIB_DISTRIBUTION_MIRROR} ${DIB_RELEASE} ${DIB_DEBIAN_COMPONENTS_WS}"
fi

export DIB_APT_SOURCES_CONF=${DIB_APT_SOURCES_CONF:-${DIB_APT_SOURCES_CONF_DEFAULT}}