red(){ echo -e "\033[31m\033[01m$1\033[0m"; }
green(){ echo -e "\033[32m\033[01m$1\033[0m"; }
reading(){ read -rp "$(green "$1")" "$2"; }

ARCHITECTURE="$(arch)"
case $ARCHITECTURE in
x86_64 )  FILE=besttrace;;
aarch64 ) FILE=besttracearm;;
i386 )    FILE=besttracemac;;
* ) red " 只支持 AMD64、ARM64、Mac 使用，问题反馈:[https://github.com/fscarmen/tools/issues] " && exit 1;;
esac

# green " 本脚说明：测 VPS ——> 对端 经过的地区及线路，填本地IP就是测回程，核心程序来由: https://www.ipip.net/ ，请知悉！"
wget https://github.com/fscarmen/tools/raw/main/besttrace/besttrace >/dev/null 2>&1
chmod 777 besttrace >/dev/null 2>&1
wget https://github.com/fscarmen/tools/raw/main/besttrace/besttracearm >/dev/null 2>&1 
chmod 777 besttracearm >/dev/null 2>&1
# wget https://github.com/fscarmen/tools/raw/main/besttrace/besttracemac >/dev/null 2>&1 
# chmod 777 besttracemac >/dev/null 2>&1
[[ ! -e "$FILE" ]] >/dev/null 2>&1 && wget https://github.com/fscarmen/tools/raw/main/besttrace/$FILE >/dev/null 2>&1 && chmod 777 $FILE >/dev/null 2>&1
chmod +x "$FILE" >/dev/null 2>&1
sudo ./"$FILE" "$1" -g cn
# rm -rf besttracemac
rm -rf besttracearm >/dev/null 2>&1
rm -rf besttrace >/dev/null 2>&1
