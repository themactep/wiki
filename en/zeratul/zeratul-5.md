Ingenic Zeratul Development
===========================

Quick Start Optimization
------------------------

### Preface:

Camera needs to start quickly to capture the image at the first time,
Ingenic official first frame image is 200ms, the actual application time will
be quite long.

#### 1. Run the main program as soon as possible

The main program should be placed in the rootfs and loaded and run at the
first time. For example, in rcS, you can run the main program after the
environment variables are set.

Dynamic libraries that the main program depends on should be placed in the 
rootfs, e.g. `libimp.so`.

After the main application starts, it first initializes the video, and then can
handle other services in parallel (e.g. P2P, authentication, etc.)

If there are dependencies on certain configuration files, such as those in the 
config partition, you can use the following method to detect the wait.

#### 2. Shorten the loading time of rootfs

The way to reduce the load time is to optimize the size of the rootfs as much
as possible. There are several ways to do this:

- non-boot-essential resources, try to place them in the system partition, 
  e.g., network audio, font files, etc.

- Dynamic libraries that the main application depends on, if they are not boot 
  dependent, can be placed in the system partition, but they should be loaded 
  by `dl_open`. For example, `libcrypto` is a relatively large library and is 
  only used occasionally.

#### 3. Quick start resolution and nrvbs setting method

Since the upper layer and the driver layer need to work closely together, some
configuration information needs to be configured in advance, such as the sensor.

As the upper layer needs to work closely with the driver layer, some configuration
information needs to be configured in advance, such as the width and height of
the sensor and the number of video buffers configured.

In practice, the higher the resolution, the slower the startup time will be.

#### 4. Frame rate modification

Since T31 has RISC-V, which recommends a high frame rate, but the actual product
frame rate is usually 15fps, how does the actual frame rate reduction work?

The frame rate in RISC-V is determined by the sensor initialization sequence,
which is the corresponding sensor initialization sequence in the 
`tools/make_tag/sensor_init_setting` folder.

During the kernel, the ISP driver provides some callbacks and APIs, such as the
`tx_isp_frame_done_int_hander` callback function, which is called after the
hardware generates a frame done interrupt, and every time an interrupt is
generated, the count starts at 1.

We can toggle the frame rate in this callback function, because the sensor is 
usually configured to take effect every other frame, so the frame rate is 
usually set on the first frame and actually takes effect on the third frame.
The purpose of this is that the first two frames are still at high frame rate,
and the third frame is cut to 15 fps, so that if the first two frames are poor,
we can discard them and increase the speed of the first frame.

#### 5. Output time optimization

The kernel time printing can be done by `DEBUG_TTFF();` to print the corresponding
time, which starts from power on.

Some sensors do not count many frames in RISC-V because the frame rate is not very
high, and the kernel defaults to 6 frames, which may result in a long wait time.

```
247  timeout = 1000;
248  while(timeout--) {
249      ret = tx_isp_get_riscv_framecount(&frame_count);
250      if(ret < 0) {
251          printk("Error: %s tx_isp_get_riscv_framecount failed ret:%d\n", __func__, ret);
252          return ret;
253      }
254
255      if((frame_count >= 6) && (frame_count != -1))
256          break;
257
258      mdelay(1);                                                                                                                                                                
259  }
260
261  DEBUG_TTFF("wait 8 frame done");
```

The default kernel frame drop parameter is configured for two frames, and the 
requirement is to drop at least one frame, so when optimizing the output time,
you can change the frame drop parameter to one frame, as long as the image is
not significantly abnormal. This way you can optimize the time to one frame. 
In addition, the frame rate switch mentioned above works with frame drops, so
that the dropped frames run at a higher frame rate, which saves some time.

######################2022.08.28######################  
This blog will not be updated  
New article content and attached project files  
Please go to liwen01 blog home page for information  
liwen01 2022.08.28 Updated on  
######################2022.08.28######################
