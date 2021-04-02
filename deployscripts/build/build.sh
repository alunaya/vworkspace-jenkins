rm -rf ~/build-temp
mkdir -p ~/build-temp
cp -a ./ ~/build-temp
cp -a ./deployscripts/build/ ~/build-temp
cd ~/build-temp
git submodule update --init
docker build \
--build-arg http_proxy=http://10.61.11.42:3128 \
--build-arg https_proxy=http://10.61.11.42:3128 \
-t 192.168.0.3:5000/vworkspace ~/build-temp
rm -rf ~/build-temp
