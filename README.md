luci-app-redsocks2
===
为OpenWRT上Redsocks2而写的luci页面

简介
---

软件包只包含OpenWrt的luci页面，不包含init.d和config。编译Redsocks2的ipk请参考此项目[openwrt-redsocks2][1]

主要功能

1、支持Socks5协议的透明代理

2、内置Shadowsocks协议，支持全局UDP转发，无需再专门安装Shadowsocks

3、支持透明代理转VPN，可以把流量直接转发到VPN的虚拟网卡上去

4、支持TCPDNS，配合透明代理不仅可有效避免污染，还能实现国内外智能分流

注：TCPDNS要配合黑名单端口

5、启动脚本修改黑白名单功能，原理：先判断匹配黑名单，如果目的地IP在黑名单之中则转给黑名单端口，黑单名端口可以由redsocks2接管

注：此黑名单目的是为了强制一部分目的地IP走代理以便访问costco或netflix等直连可以打开但无法正常使用的情况。再判断匹配白名单，如果目的地IP不在白名单之中则转给redsocks2端口

编译
---

 - 从 OpenWrt 的 [SDK][S] 编译  

   ```bash
   # 以 ar71xx 平台为例
   tar xjf OpenWrt-SDK-ar71xx-for-linux-x86_64-gcc-4.8-linaro_uClibc-0.9.33.2.tar.bz2
   cd OpenWrt-SDK-ar71xx-*
   # 获取 Makefile
   git clone https://github.com/wltc2005/luci-app-redsocks2.git package/luci-app-redsocks2
   # 选择要编译的包 Luci -> Network -> luci-app-redsocks2
   make menuconfig V=s
   # 开始编译
   make package/luci-app-redsocks2/compile V=s
   ```

----------

[1]: https://github.com/wltc2005/openwrt-redsocks2
[S]: http://wiki.openwrt.org/doc/howto/obtain.firmware.sdk