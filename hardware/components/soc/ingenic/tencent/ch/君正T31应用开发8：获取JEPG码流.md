# 君正T31应用开发8：获取JEPG码流

## 君正T31应用开发8：获取JEPG码流

原创

**发布于** **2023-06-11 11:18:20**

**331**1

**举报**

# 1.获取JEPG码流的框架

文件名称sample-Encoder-jpeg.c

主要的取图的代码流程是下面这样的：

​![](pix/net-img-8c265ec5329bbaf0e3a37aa4e1f6464a-20230919120516-cgml85a.png)​

首先我们这个文件大部分功能是依赖于sample-common.h和sample-common.c这两个文件的，大部分demo都是调用这个common.c提供的基础库进行开发的。

PS：君正T31的基础库API函数，大部分都是IMP_XXX_XXX这样类型格式的函数的，例如

IMP_OSD_SetPoolSize

IMP_ISP_AddSensor

等等

### 1.1：初始化T31系统参数：sample_system_init

```
int sample_system_init()
{
    int ret = 0;

    IMP_OSD_SetPoolSize(512*1024);
    memset(&sensor_info, 0, sizeof(IMPSensorInfo));
    memcpy(sensor_info.name, SENSOR_NAME, sizeof(SENSOR_NAME));
    sensor_info.cbus_type = SENSOR_CUBS_TYPE;
    memcpy(sensor_info.i2c.type, SENSOR_NAME, sizeof(SENSOR_NAME));
    sensor_info.i2c.addr = SENSOR_I2C_ADDR;

    IMP_LOG_DBG(TAG, "sample_system_init start\n");

    ret = IMP_ISP_Open();
    if(ret < 0){
        IMP_LOG_ERR(TAG, "failed to open ISP\n");
        return -1;
    }

    ret = IMP_ISP_AddSensor(&sensor_info);
    if(ret < 0){
        IMP_LOG_ERR(TAG, "failed to AddSensor\n");
        return -1;
    }

    ret = IMP_ISP_EnableSensor();
    if(ret < 0){
        IMP_LOG_ERR(TAG, "failed to EnableSensor\n");
        return -1;
    }

    ret = IMP_System_Init();
    if(ret < 0){
        IMP_LOG_ERR(TAG, "IMP_System_Init failed\n");
        return -1;
    }

    /* enable turning, to debug graphics */
    ret = IMP_ISP_EnableTuning();
    if(ret < 0){
        IMP_LOG_ERR(TAG, "IMP_ISP_EnableTuning failed\n");
        return -1;
    }
    IMP_ISP_Tuning_SetContrast(128);
    IMP_ISP_Tuning_SetSharpness(128);
    IMP_ISP_Tuning_SetSaturation(128);
    IMP_ISP_Tuning_SetBrightness(128);
#if 1
    ret = IMP_ISP_Tuning_SetISPRunningMode(IMPISP_RUNNING_MODE_DAY);
    if (ret < 0){
        IMP_LOG_ERR(TAG, "failed to set running mode\n");
        return -1;
    }
#endif
#if 0
    ret = IMP_ISP_Tuning_SetSensorFPS(SENSOR_FRAME_RATE_NUM, SENSOR_FRAME_RATE_DEN);
    if (ret < 0){
        IMP_LOG_ERR(TAG, "failed to set sensor fps\n");
        return -1;
    }
#endif
    IMP_LOG_DBG(TAG, "ImpSystemInit success\n");

    return 0;
}
```

复制

其中主要讲解这个API函数：IMP_ISP_AddSensor

这个函数是系统加载sensor的函数，我们的T31程序不仅仅可以加载一种sensor，还可以加载很多各种各样的sensor，其中我从淘宝买回来的测试机器，它用的sensor是SENSOR_SC5235这种sensor。

我们可以通过下面图的sensor的一些宏定义观察他主要传递给SDK的参数信息。

SDK库默认的sensor是jxf23，所以我们要调用JPEG的码流进行操作的话，需要先进行修改代码才能够使用。

​![](pix/net-img-147c643d89c3ad0f3b22c8e256f57aea-20230919120517-tx2pnjw.png)​

### 1.2：初始化视频源：sample_framesource_init

关键的函数参数IMP_FrameSource_CreateChn

根据上一个章节我们说过的，你如果需要使用视频相关的API，那么你就必须要初始化视频源，而视频源的初始化的步奏：

Init初始化流程

1.创建通道

2.设置通道

3.使能通道

下面的函数主要做了这两个步奏：

创建通道和设置通道属性。

```
主码流：
    struct chn_conf chn[FS_CHN_NUM] = {
    {
        .index = CH0_INDEX,
        .enable = CHN0_EN,
    .payloadType = IMP_ENC_PROFILE_HEVC_MAIN,
        .fs_chn_attr = {
            .pixFmt = PIX_FMT_NV12,
            .outFrmRateNum = SENSOR_FRAME_RATE_NUM,
            .outFrmRateDen = SENSOR_FRAME_RATE_DEN,
            .nrVBs = 2,
            .type = FS_PHY_CHANNEL,

            .scaler.enable = 0,

            .crop.enable = CROP_EN,
            .crop.top = 0,
            .crop.left = 0,
            .crop.width = SENSOR_WIDTH,
            .crop.height = SENSOR_HEIGHT,

            .picWidth = SENSOR_WIDTH,
            .picHeight = SENSOR_HEIGHT,
           },
        .framesource_chn =    { DEV_ID_FS, CH0_INDEX, 0},
        .imp_encoder = { DEV_ID_ENC, CH0_INDEX, 0},
    },
```

复制

```
int sample_framesource_init()
{
    int i, ret;

    for (i = 0; i < FS_CHN_NUM; i++) {
        if (chn[i].enable) {
            IMP_LOG_INFO(TAG,"sample_framesource_init i = %d\n",i);
            ret = IMP_FrameSource_CreateChn(chn[i].index, &chn[i].fs_chn_attr);
            if(ret < 0){
                IMP_LOG_ERR(TAG, "IMP_FrameSource_CreateChn(chn%d) error !\n", chn[i].index);
                return -1;
            }

            ret = IMP_FrameSource_SetChnAttr(chn[i].index, &chn[i].fs_chn_attr);
            if (ret < 0) {
                IMP_LOG_ERR(TAG, "IMP_FrameSource_SetChnAttr(chn%d) error !\n",  chn[i].index);
                return -1;
            }
        }
    }
    return 0;
}
```

复制

### 1.3：设置编码类型IMP_Encoder_CreateGroup

我们这边设置编码需要多少组数据，设置编码组的概念：也是上节课说过的内容；

一个编码组不仅仅可以编码H264的码流数据，也可以编码JPEG的数据。

```
    for (i = 0; i < FS_CHN_NUM; i++) {
        if (chn[i].enable) {
            ret = IMP_Encoder_CreateGroup(chn[i].index);
            if (ret < 0) {
                IMP_LOG_ERR(TAG, "IMP_Encoder_CreateGroup(%d) error !\n", i);
                return -1;
            }
        }
    }
```

复制

### 1.4：初始化编码参数sample_jpeg_init

其中最主要的参数是这个函数：IMP_Encoder_SetDefaultParam

设置编码默认参数：IMP_ENC_PROFILE_JPEG

```
int sample_jpeg_init()
{
    int i, ret;
    IMPEncoderChnAttr channel_attr;
    IMPFSChnAttr *imp_chn_attr_tmp;

    for (i = 0; i <  FS_CHN_NUM; i++) {
        if (chn[i].enable) {
            imp_chn_attr_tmp = &chn[i].fs_chn_attr;
            memset(&channel_attr, 0, sizeof(IMPEncoderChnAttr));
            ret = IMP_Encoder_SetDefaultParam(&channel_attr, IMP_ENC_PROFILE_JPEG, IMP_ENC_RC_MODE_FIXQP,
                    imp_chn_attr_tmp->picWidth, imp_chn_attr_tmp->picHeight,
                    imp_chn_attr_tmp->outFrmRateNum, imp_chn_attr_tmp->outFrmRateDen, 0, 0, 25, 0);
            /* Create Channel */
            ret = IMP_Encoder_CreateChn(4 + chn[i].index, &channel_attr);
            if (ret < 0) {
                IMP_LOG_ERR(TAG, "IMP_Encoder_CreateChn(%d) error: %d\n",
                            chn[i].index, ret);
                return -1;
            }
            /* Resigter Channel */
            ret = IMP_Encoder_RegisterChn(i, 4 + chn[i].index);
            if (ret < 0) {
                IMP_LOG_ERR(TAG, "IMP_Encoder_RegisterChn(0, %d) error: %d\n",
                            chn[i].index, ret);
                return -1;
            }
        }
    }
    return 0;
}
```

复制

### 1.5：IMP_System_Bind系统绑定函数

主要的步奏：就是将你初始化的视频源和编码器绑定在一块。

```
    /* Step.4 Bind */
    for (i = 0; i < FS_CHN_NUM; i++) {
        if (chn[i].enable) {
            ret = IMP_System_Bind(&chn[i].framesource_chn, &chn[i].imp_encoder);
            if (ret < 0) {
                IMP_LOG_ERR(TAG, "Bind FrameSource channel%d and Encoder failed\n",i);
                return -1;
            }
        }
    }
```

复制

### 1.6：开启视频源数据sample_framesource_streamon

这部分就是前面说到的先创建视频源，再次设置视频源，然后使能视频源。

```
int sample_framesource_streamon()
{
    int ret = 0, i = 0;
    /* Enable channels */
    for (i = 0; i < FS_CHN_NUM; i++) {
        if (chn[i].enable) {
            IMP_LOG_INFO(TAG,"sample_framesource_streamon i = %d\n",i);
            ret = IMP_FrameSource_EnableChn(chn[i].index);
            if (ret < 0) {
                IMP_LOG_ERR(TAG, "IMP_FrameSource_EnableChn(%d) error: %d\n", ret, chn[i].index);
                return -1;
            }
        }
    }
    return 0;
}
```

复制

# 2.获取JPEG的码流函数

### 2.1：sample_get_jpeg_snap获取截图的码流。

在我们前面初始化的所有的事情都做好了之后，包括初始化视频源数据和绑定我们的编码方式，这里面我们绑定的编码方式是JPEG的编码模式。接下来我们就来获取JPEG的数据。

IMP_Encoder_StartRecvPic：开启编码Channel接收图像

IMP_Encoder_PollingStream：Polling码流缓存，我们设置的超时时间为1秒。

IMP_Encoder_GetStream：

**对于H264和H265类型码流，一次调用成功获取一帧的码流，这帧码流可能包含多个包。**

**对于JPEG类型码流，一次调用成功获取一帧的码流，这帧码流只包含一个包，这一帧包含了JPEG图片文件的完整信息。**

**最后我们通过这个函数回调结构体的数据上来，进行保存到我们的TF卡上面就完成了获取JPEG码流的步奏。**

```
/**
 * 定义编码帧码流类型结构体
 */
typedef struct {
    uint32_t          phyAddr;          /**< 帧码流物理地址 */
    uint32_t          virAddr;          /**< 帧码流包虚拟地址 */
    uint32_t          streamSize;       /**< virAddr对应分配的地址空间大小 */
    IMPEncoderPack  *pack;                /**< 帧码流包结构 */
    uint32_t        packCount;            /**< 一帧码流的所有包的个数 */
    uint32_t        seq;                /**< 编码帧码流序列号 */
    union
    {
        IMPEncoderStreamInfo streamInfo;
        IMPEncoderJpegInfo jpegInfo;
    };
} IMPEncoderStream;
```

复制

```
static int save_stream(int fd, IMPEncoderStream *stream)
{
    int ret, i, nr_pack = stream->packCount;

  //IMP_LOG_DBG(TAG, "----------packCount=%d, stream->seq=%u start----------\n", stream->packCount, stream->seq);
    for (i = 0; i < nr_pack; i++) {
    //IMP_LOG_DBG(TAG, "[%d]:%10u,%10lld,%10u,%10u,%10u\n", i, stream->pack[i].length, stream->pack[i].timestamp, stream->pack[i].frameEnd, *((uint32_t *)(&stream->pack[i].nalType)), stream->pack[i].sliceType);
        IMPEncoderPack *pack = &stream->pack[i];
        if(pack->length){
            uint32_t remSize = stream->streamSize - pack->offset;
            if(remSize < pack->length){
                ret = write(fd, (void *)(stream->virAddr + pack->offset), remSize);
                if (ret != remSize) {
                    IMP_LOG_ERR(TAG, "stream write ret(%d) != pack[%d].remSize(%d) error:%s\n", ret, i, remSize, strerror(errno));
                    return -1;
                }
                ret = write(fd, (void *)stream->virAddr, pack->length - remSize);
                if (ret != (pack->length - remSize)) {
                    IMP_LOG_ERR(TAG, "stream write ret(%d) != pack[%d].(length-remSize)(%d) error:%s\n", ret, i, (pack->length - remSize), strerror(errno));
                    return -1;
                }
            }else {
                ret = write(fd, (void *)(stream->virAddr + pack->offset), pack->length);
                if (ret != pack->length) {
                    IMP_LOG_ERR(TAG, "stream write ret(%d) != pack[%d].length(%d) error:%s\n", ret, i, pack->length, strerror(errno));
                    return -1;
                }
            }
        }
    }
  //IMP_LOG_DBG(TAG, "----------packCount=%d, stream->seq=%u end----------\n", stream->packCount, stream->seq);
    return 0;
}
```

复制

### 2.2：释放我们获取JPEG通道的码流数据

IMP_Encoder_ReleaseStream

用户获取码流后必须及时释放已经获取的码流缓存，否则可能会导致码流buffer满，影响编码器编码。

此接口应当和IMP_Encoder_GetStream配对起来使用

IMP_Encoder_StopRecvPic：停止编码Channel接收图像

### 2.3：退出编码的流程

sample_framesource_streamoff

```
int sample_framesource_streamoff()
{
    int ret = 0, i = 0;
    /* Enable channels */
    for (i = 0; i < FS_CHN_NUM; i++) {
        if (chn[i].enable){
            ret = IMP_FrameSource_DisableChn(chn[i].index);
            if (ret < 0) {
                IMP_LOG_ERR(TAG, "IMP_FrameSource_DisableChn(%d) error: %d\n", ret, chn[i].index);
                return -1;
            }
        }
    }
    return 0;
}
```

复制

IMP_System_UnBind

解绑，我们刚才绑定获取图片的线程，从这边来看，我们只是在主码流或者子码流的情况下获取一帧数据，所以demo得实验情况也是得到两张图片，一张是主码流的图像，一张是子码流的图像。

```
int sample_jpeg_exit(void)
{
    int ret = 0, i = 0, chnNum = 0;
    IMPEncoderChnStat chn_stat;

    for (i = 0; i <  FS_CHN_NUM; i++) {
        if (chn[i].enable) {
            chnNum = 4 + chn[i].index;
            memset(&chn_stat, 0, sizeof(IMPEncoderChnStat));
            ret = IMP_Encoder_Query(chnNum, &chn_stat);
            if (ret < 0) {
                IMP_LOG_ERR(TAG, "IMP_Encoder_Query(%d) error: %d\n", chnNum, ret);
                return -1;
            }

            if (chn_stat.registered) {
                ret = IMP_Encoder_UnRegisterChn(chnNum);
                if (ret < 0) {
                    IMP_LOG_ERR(TAG, "IMP_Encoder_UnRegisterChn(%d) error: %d\n", chnNum, ret);
                    return -1;
                }

                ret = IMP_Encoder_DestroyChn(chnNum);
                if (ret < 0) {
                    IMP_LOG_ERR(TAG, "IMP_Encoder_DestroyChn(%d) error: %d\n", chnNum, ret);
                    return -1;
                }
            }
        }
    }

    return 0;
}
```

复制

### 2.4：退出系统初始化，让系统关闭功能

sample_system_exit

```
int sample_system_exit()
{
    int ret = 0;

    IMP_LOG_DBG(TAG, "sample_system_exit start\n");


    IMP_System_Exit();

    ret = IMP_ISP_DisableSensor();
    if(ret < 0){
        IMP_LOG_ERR(TAG, "failed to EnableSensor\n");
        return -1;
    }

    ret = IMP_ISP_DelSensor(&sensor_info);
    if(ret < 0){
        IMP_LOG_ERR(TAG, "failed to AddSensor\n");
        return -1;
    }

    ret = IMP_ISP_DisableTuning();
    if(ret < 0){
        IMP_LOG_ERR(TAG, "IMP_ISP_DisableTuning failed\n");
        return -1;
    }

    if(IMP_ISP_Close()){
        IMP_LOG_ERR(TAG, "failed to open ISP\n");
        return -1;
    }

    IMP_LOG_DBG(TAG, " sample_system_exit success\n");

    return 0;
}
```

复制

# 3.实验效果：获取两张图片

这里面，我故意在demo里面添加了一部分的日志，方便和我上述的情况做对比，实际程序运行也是按照我说的流程去跑的。

​![](pix/net-img-90208137f8490ff65853ae21df4486b4-20230919120517-20gmlxn.png)​

得到的分辨率也和我们设置的分辨率也是一致的，可以判断，整个过程完美结束。

​![](pix/net-img-d587bc0a16235e422cff89f5e4f522ba-20230919120517-w00yv5k.png)​

​![](pix/net-img-8918bcde57b4a343b623d386a67818c9-20230919120518-wocl2on.png)​

原创声明：本文系作者授权腾讯云开发者社区发表，未经许可，不得转载。

如有侵权，请联系 [cloudcommunity@tencent.com](mailto:cloudcommunity@tencent.com) 删除。
