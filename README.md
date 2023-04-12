# racadm cli tool

This docker file allows you to run `racadm` commands via docker ( any OS ).

Example usage:

```bash
podman build -t racadm-with-python-dracclient:centos9 .
podman run -ti racadm-with-python-dracclient:centos9 racadm -u root -p root -r 192.168.1.10 racdump
# if you have network issue, you can also precede your command with a timeout
timeout -s SIGKILL 25 podman run -ti racadm-with-python-dracclient:centos9 racadm -u root -p root -r 192.168.1.10 racdump
```

## Other tools

other tools are included in the image like [`python-dracclient`](https://opendev.org/openstack/python-dracclient/) and [`racadm_init`](https://github.com/remyd1/racadm_init).
