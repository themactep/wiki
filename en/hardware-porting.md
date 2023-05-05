

In oder to make things work on OpenIPC firmware as
it used to work on a stock one, you will need to transfer
hardware settings into the new system.

First, get access into stock firmware and save contents 
of its /proc/umap/*

```
cat /proc/umap/*
```

Then get ipctool on the camera and run
```
ipctool reginfo
ipctool reginfo --script
ipctool gpio scan
```


### Finding IR-cut GPIO pins

On the stock firmware, run `ipctool gpio scan` and open-close camera's lens with a palm oh your hand a few times. Check the
output for changes.
