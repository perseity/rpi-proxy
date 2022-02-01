# Proxy and reverse proxy setup on RPI Zero

```
____________________________________________                                   ______________________________________________________________
|   *DEVICE w/o wifi, but with ethernet*   | <--== *ethernet connection* ==--> | *RPI ZERO WH w/ eth hat and proxy setup connected to wifi* |
--------------------------------------------                                   --------------------------------------------------------------
```

* Device gets proxied internet connection via nftables and port 80 and 23 of the device is available in the wlan ip adress of the rpi zero
