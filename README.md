# Proxy and reverse proxy setup on RPI Zero

```
___________________                                   _______________________________
|   DEVICE        |                                   |  RPI ZERO WH                |
|   w/o wifi      | <--== *ethernet connection* ==--> |  w/ eth hat and proxy setup |
|   w/ ethernet   |                                   |  connected to wifi          |
-------------------                                   -------------------------------
```

* Device gets proxied internet connection via nftables and port 80 and 23 of the device is available on the wlan ip address of the rpi zero
