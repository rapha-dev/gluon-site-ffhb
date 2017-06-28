GLUON_SITE_PACKAGES := \
	gluon-mesh-babel \
	gluon-l3roamd \
	gluon-respondd \
	respondd-module-airtime \
	gluon-autoupdater \
	gluon-config-mode-core \
	gluon-config-mode-hostname \
	gluon-config-mode-autoupdater \
	gluon-config-mode-mesh-vpn \
	gluon-config-mode-geo-location \
	gluon-config-mode-contact-info \
	gluon-web-admin \
	gluon-web-autoupdater \
	gluon-web-mesh-vpn-fastd \
	gluon-web-network \
	gluon-web-private-wifi \
	gluon-web-wifi-config \
	gluon-mesh-vpn-fastd \
	gluon-client-bridge \
	gluon-radvd \
	gluon-setup-mode \
	gluon-speedtest \
	gluon-status-page \
	iputils-ping6 \
	ip-tiny \
	iwinfo \
	iptables \
	gluon-iptables-clamp-mss-to-pmtu \
	haveged

ifeq ($(GLUON_TARGET),ar71xx-tiny)
# save some space to build ar71xx-tiny package
GLUON_SITE_PACKAGES += -iputils-ping6
GLUON_SITE_PACKAGES += -libpcap
GLUON_SITE_PACKAGES += -tcpdump
GLUON_SITE_PACKAGES += -strace
endif

ifeq ($(GLUON_TARGET),x86-64)
GLUON_DEBUG := 1
GLUON_SITE_PACKAGES += \
	kmod-usb-core \
	kmod-usb2 \
	kmod-usb-hid \
	kmod-usb-net \
	kmod-usb-net-asix \
	kmod-usb-net-dm9601-ether \
	kmod-cfg80211 \
	libnl \
	gdb \
	valgrind \
	screen \
	iftop \
	tcpdump \
	binutils \
	464xlat \
	strace
endif

# Allow overriding the these variables from the command line
GLUON_RELEASE ?= $(patsubst v%,%,$(shell git -C $(GLUON_SITEDIR) describe --tags --dirty=+))
export GLUON_BRANCH ?= stable
GLUON_PRIORITY ?= 0
GLUON_LANGS ?= en de
GLUON_REGION ?= eu
GLUON_ATH10K_MESH ?= 11s
