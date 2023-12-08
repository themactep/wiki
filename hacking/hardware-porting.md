
To make things work on OpenIPC firmware as they used to work on a stock one, 
you will need to transfer hardware settings into the new system.

First, get access to stock firmware and save contents of its /proc/umap/*

```
cat /proc/umap/*
```

Then get `ipctool` on the camera and run

```
ipctool reginfo
ipctool reginfo --script
ipctool gpio scan
```

