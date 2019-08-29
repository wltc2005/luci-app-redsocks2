include $(TOPDIR)/rules.mk

PKG_NAME:=luci-app-redsocks2
PKG_VERSION=1.0
PKG_RELEASE:=1
PKG_MAINTAINER:=LuckyStar

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)

include $(INCLUDE_DIR)/package.mk

define Package/$(PKG_NAME)
	SECTION:=luci
	CATEGORY:=Network
	SUBMENU:=Luci
	TITLE:=LuCI Support for redsocks2
	PKGARCH:=all
	DEPENDS:=+redsocks2 +ipset
endef

define Package/$(PKG_NAME)/description
    LuCI Support for redsocks2
endef

define Build/Compile
endef

define Package/$(PKG_NAME)/install
    $(CP) ./files/* $(1)/
endef

$(eval $(call BuildPackage,$(PKG_NAME)))
