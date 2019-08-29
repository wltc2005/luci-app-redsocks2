m=Map("redsocks2",translate("Redsocks2 - Advanced Settings"))
s=m:section(TypedSection,"redsocks2_autoproxy",translate("Auto Proxy Options"))
s.anonymous=true
o=s:option(Value,"no_quick_check_seconds",translate("Direct Connect Timeout"))
o.datatype="uinteger"
o=s:option(Value,"quick_connect_timeout",translate("Quick Check Timeout"))
o.datatype="uinteger"
s=m:section(TypedSection,"redsocks2_ipcache",translate("IP Cache Options"))
s.anonymous=true
o=s:option(Value,"cache_file",translate("Cache File Path"))
o=s:option(Value,"stale_time",translate("Stale Time"))
o.datatype="uinteger"
o=s:option(Value,"autosave_interval",translate("Autosave Interval"))
o.datatype="uinteger"
o=s:option(Flag,"port_check",translate("Enable Port-based IP Cache"))
o.rmempty=false
local apply = luci.http.formvalue("cbi.apply")
if apply then
	os.execute("/etc/init.d/redsocks2 restart >/dev/null 2>&1 &")
end
return m