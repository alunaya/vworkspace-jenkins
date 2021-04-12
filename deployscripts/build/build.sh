cp -a ./deployscripts/build/* ./
git submodule update --init
ls -la
docker build \
--build-arg http_proxy=http://10.61.11.42:3128 \
--build-arg https_proxy=http://10.61.11.42:3128 \
-t 192.168.0.3:5000/vworkspace .

docker push 192.168.0.3:5000/vworkspace
# Revert changes to modified files.
git reset --hard
# Remove all untracked files and directories.
# '-f' is force, '-d' is remove directories.
git clean -fd