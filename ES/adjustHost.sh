if [ "$USER" != "root" ]; then
    echo "This script needs to be executed with root permission. Run it with sudo";
    exit 1;
fi

sysctl -w vm.max_map_count=262144;
tee -a /etc/sysctl.conf << END
#Added by FL to be able to run elasticsearch in docker container
vm.max_map_count=262144
END