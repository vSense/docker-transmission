# docker-transmission

Docker container for torrent client Transmission

You just have to mount your download directory into /download to make it work.
Optionally, you could mount your own config directory into /etc/transmission-daemon

Usage :

```docker run -d -p 12345:12345 -p 12345:12345/udp -p 9091:9091 --name transmission -v /download:/download -v /config:/etc/transmission-daemon vsense/transmission```
