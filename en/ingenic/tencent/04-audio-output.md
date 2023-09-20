# 君正T31应用开发4-音频输出

## 君正T31应用开发4-音频输出

原创

**发布于** **2023-04-01 21:27:09**

**468**0

**举报**

# 1.什么是音频输出？

其实手机，任何设备都有音频输出这个概念。比如你在电脑上面播放“只因你太美”这首歌曲的时候，电脑通过网易云音乐，或者别的音乐，调用电脑底层的驱动，最后把数字信号，转换成模拟信号在设备里面的喇叭这个硬件播放。

君正T31芯片也有提供这样的接口，君正芯片也有两个引脚，接对接的喇叭，硬件，通过具体的API进行控制，然后达到将君正芯片咪头采集到的声音，传输到君正T31芯片的喇叭播放。

# 2.音频输出的系统框图

​![](assets/net-img-874e3d9b46f83ed2f7042e91103f9d04-20230919120119-xfl74e1.png)​

# 3.音频输出的代码详解

### 3.1. 音频输出测试线程_ao_test_play_thread：这是君正给的demo程序。

### 基础算法：我们需要申请一段临时内存，因为我们需要把芯片的音频文件，传输到芯片的内存当中，因为芯片无法快速的操作flash，我们都会把计算的任务给内存进行。

计算内存的方法：

Hz（赫兹）是频率单位，其含义是每秒钟的次数，这里面我们采样率是16000，也就是我们每秒钟采样16000次。

AO_TEST_BUF_SIZE  = (AO_TEST_SAMPLE_RATE*sizeof(short)*AO_TEST_SAMPLE_TIME/1000)

这个buffer的意思就是，我们在20豪秒的音频数据的大小，也就是我们读取音频文件缓存的大小。

```js
    #define AO_TEST_SAMPLE_RATE 16000
    #define AO_TEST_SAMPLE_TIME 20
    #define AO_TEST_BUF_SIZE (AO_TEST_SAMPLE_RATE * sizeof(short) * AO_TEST_SAMPLE_TIME / 1000)
    #define AO_BASIC_TEST_PLAY_FILE  "./ao_paly.pcm"

	buf = (unsigned char *)malloc(AO_TEST_BUF_SIZE);
	if (buf == NULL) {
		IMP_LOG_ERR(TAG, "[ERROR] %s: malloc audio buf error\n", __func__);
		return NULL;
	}
```

复制

### 3.2.IMP_AO_SetPubAttr

```js
	/* Step 1: set public attribute of AO device. */
	/*跟AI很像，不过有一个点用户手册没有说明白，devID没有说出来，测试用例使用0，我们这边也使用0*/
	int devID = 0;
	IMPAudioIOAttr attr;
	attr.samplerate = AUDIO_SAMPLE_RATE_16000;
	attr.bitwidth = AUDIO_BIT_WIDTH_16;
	attr.soundmode = AUDIO_SOUND_MODE_MONO;
	attr.frmNum = 20;
	attr.numPerFrm = 640;
	attr.chnCnt = 1;
	ret = IMP_AO_SetPubAttr(devID, &attr);
	if (ret != 0) {
		IMP_LOG_ERR(TAG, "set ao %d attr err: %d\n", devID, ret);
		return NULL;
	}
```

复制

### 3.3.IMP_AO_SendFrame&IMP_AO_QueryChnStat

阻塞与非阻塞的概念：

阻塞就是等待的过程，什么时候等待，比如你传递给AO数据的时候，我们需要等待上次发送的数据全部发送完毕之后才继续发送下一帧的音频数据，不然就会产生音频断裂的感觉。

因为阻塞才能保证我们传递的数据是完整的，少部分的情况下。

比如RTMP协议的时候，有些时候，由于网络波动的情况下，我们会黑屏，因为我们追求的是音视频的[直播](https://cloud.tencent.com/product/css?from_column=20065&from=20065)的实时性，但是这时候由于网络的不稳定，使用UDP协议的时候，就无法进行重传，因为我们要保证我们直播的实时性。

```js
		/**
 		* 音频流阻塞类型
 		*/
		typedef enum {
				BLOCK = 0,				/**< 阻塞 */
				NOBLOCK = 1,			/**< 非阻塞 */
		} IMPBlock;

		/* Step 5: send frame data.我们使用阻塞的模式进行 */
		IMPAudioFrame frm;
		frm.virAddr = (uint32_t *)buf;
		frm.len = size;
		ret = IMP_AO_SendFrame(devID, chnID, &frm, BLOCK);
		if (ret != 0) {
			IMP_LOG_ERR(TAG, "send Frame Data error\n");
			return NULL;
		}

		/*查询音频输出通道中当前的音频数据缓存状态*/
		IMPAudioOChnState play_status;
		ret = IMP_AO_QueryChnStat(devID, chnID, &play_status);
		if (ret != 0) {
			IMP_LOG_ERR(TAG, "IMP_AO_QueryChnStat error\n");
			return NULL;
		}
```

复制

### 3.4.IMP_AO_PauseChn&IMP_AO_ClearChnBuf&IMP_AO_ResumeChn

当达到40桢的时候，暂停播放音频的接口，然后在linux命令行里面敲入任何字符，再继续播放音频文件的接口。

```js
		if (++i == 40) {
			ret = IMP_AO_PauseChn(devID, chnID);
			if (ret != 0) {
				IMP_LOG_ERR(TAG, "IMP_AO_PauseChn error\n");
				return NULL;
			}

			printf("[INFO] Test : Audio Play Pause test.\n");
			printf("[INFO]      : Please input any key to continue.\n");
			getchar();

			ret = IMP_AO_ClearChnBuf(devID, chnID);
			if (ret != 0) {
				IMP_LOG_ERR(TAG, "IMP_AO_ClearChnBuf error\n");
				return NULL;
			}

			ret = IMP_AO_ResumeChn(devID, chnID);
			if (ret != 0) {
				IMP_LOG_ERR(TAG, "IMP_AO_ResumeChn error\n");
				return NULL;
			}
		}
```

复制

# 4.君正音频输出DEMO

```js
static void *_ao_test_play_thread(void *argv)
{
	unsigned char *buf = NULL;
	int size = 0;
	int ret = -1;

	buf = (unsigned char *)malloc(AO_TEST_BUF_SIZE);
	if (buf == NULL) {
		IMP_LOG_ERR(TAG, "[ERROR] %s: malloc audio buf error\n", __func__);
		return NULL;
	}

	FILE *play_file = fopen(AO_BASIC_TEST_PLAY_FILE, "rb");
	if (play_file == NULL) {
		IMP_LOG_ERR(TAG, "[ERROR] %s: fopen %s failed\n", __func__, AO_BASIC_TEST_PLAY_FILE);
		return NULL;
	}

	/* Step 1: set public attribute of AO device. */
	int devID = 0;
	IMPAudioIOAttr attr;
	attr.samplerate = AUDIO_SAMPLE_RATE_16000;
	attr.bitwidth = AUDIO_BIT_WIDTH_16;
	attr.soundmode = AUDIO_SOUND_MODE_MONO;
	attr.frmNum = 20;
	attr.numPerFrm = 640;
	attr.chnCnt = 1;
	ret = IMP_AO_SetPubAttr(devID, &attr);
	if (ret != 0) {
		IMP_LOG_ERR(TAG, "set ao %d attr err: %d\n", devID, ret);
		return NULL;
	}

	memset(&attr, 0x0, sizeof(attr));
	ret = IMP_AO_GetPubAttr(devID, &attr);
	if (ret != 0) {
		IMP_LOG_ERR(TAG, "get ao %d attr err: %d\n", devID, ret);
		return NULL;
	}

	IMP_LOG_INFO(TAG, "Audio Out GetPubAttr samplerate:%d\n", attr.samplerate);
	IMP_LOG_INFO(TAG, "Audio Out GetPubAttr   bitwidth:%d\n", attr.bitwidth);
	IMP_LOG_INFO(TAG, "Audio Out GetPubAttr  soundmode:%d\n", attr.soundmode);
	IMP_LOG_INFO(TAG, "Audio Out GetPubAttr     frmNum:%d\n", attr.frmNum);
	IMP_LOG_INFO(TAG, "Audio Out GetPubAttr  numPerFrm:%d\n", attr.numPerFrm);
	IMP_LOG_INFO(TAG, "Audio Out GetPubAttr     chnCnt:%d\n", attr.chnCnt);

	/* Step 2: enable AO device. */
	ret = IMP_AO_Enable(devID);
	if (ret != 0) {
		IMP_LOG_ERR(TAG, "enable ao %d err\n", devID);
		return NULL;
	}

	/* Step 3: enable AI channel. */
	int chnID = 0;
	ret = IMP_AO_EnableChn(devID, chnID);
	if (ret != 0) {
		IMP_LOG_ERR(TAG, "Audio play enable channel failed\n");
		return NULL;
	}

	/* Step 4: Set audio channel volume. */
	int chnVol = 80;
	ret = IMP_AO_SetVol(devID, chnID, chnVol);
	if (ret != 0) {
		IMP_LOG_ERR(TAG, "Audio Play set volume failed\n");
		return NULL;
	}

	ret = IMP_AO_GetVol(devID, chnID, &chnVol);
	if (ret != 0) {
		IMP_LOG_ERR(TAG, "Audio Play get volume failed\n");
		return NULL;
	}
	IMP_LOG_INFO(TAG, "Audio Out GetVol    vol:%d\n", chnVol);

	int aogain = 28;
	ret = IMP_AO_SetGain(devID, chnID, aogain);
	if (ret != 0) {
		IMP_LOG_ERR(TAG, "Audio Record Set Gain failed\n");
		return NULL;
	}

	ret = IMP_AO_GetGain(devID, chnID, &aogain);
	if (ret != 0) {
		IMP_LOG_ERR(TAG, "Audio Record Get Gain failed\n");
		return NULL;
	}
	IMP_LOG_INFO(TAG, "Audio Out GetGain    gain : %d\n", aogain);

	int i = 0;
	while (1) {
		size = fread(buf, 1, AO_TEST_BUF_SIZE, play_file);
		if (size < AO_TEST_BUF_SIZE)
			break;

		/* Step 5: send frame data. */
		IMPAudioFrame frm;
		frm.virAddr = (uint32_t *)buf;
		frm.len = size;
		ret = IMP_AO_SendFrame(devID, chnID, &frm, BLOCK);
		if (ret != 0) {
			IMP_LOG_ERR(TAG, "send Frame Data error\n");
			return NULL;
		}

		IMPAudioOChnState play_status;
		ret = IMP_AO_QueryChnStat(devID, chnID, &play_status);
		if (ret != 0) {
			IMP_LOG_ERR(TAG, "IMP_AO_QueryChnStat error\n");
			return NULL;
		}

		IMP_LOG_INFO(TAG, "Play: TotalNum %d, FreeNum %d, BusyNum %d\n",
				play_status.chnTotalNum, play_status.chnFreeNum, play_status.chnBusyNum);

		if (++i == 40) {
			ret = IMP_AO_PauseChn(devID, chnID);
			if (ret != 0) {
				IMP_LOG_ERR(TAG, "IMP_AO_PauseChn error\n");
				return NULL;
			}

			printf("[INFO] Test : Audio Play Pause test.\n");
			printf("[INFO]      : Please input any key to continue.\n");
			getchar();

			ret = IMP_AO_ClearChnBuf(devID, chnID);
			if (ret != 0) {
				IMP_LOG_ERR(TAG, "IMP_AO_ClearChnBuf error\n");
				return NULL;
			}

			ret = IMP_AO_ResumeChn(devID, chnID);
			if (ret != 0) {
				IMP_LOG_ERR(TAG, "IMP_AO_ResumeChn error\n");
				return NULL;
			}
		}
	}
	ret = IMP_AO_FlushChnBuf(devID, chnID);
	if (ret != 0) {
		IMP_LOG_ERR(TAG, "IMP_AO_FlushChnBuf error\n");
		return NULL;
	}
	/* Step 6: disable the audio channel. */
	ret = IMP_AO_DisableChn(devID, chnID);
	if (ret != 0) {
		IMP_LOG_ERR(TAG, "Audio channel disable error\n");
		return NULL;
	}

	/* Step 7: disable the audio devices. */
	ret = IMP_AO_Disable(devID);
	if (ret != 0) {
		IMP_LOG_ERR(TAG, "Audio device disable error\n");
		return NULL;
	}

	fclose(play_file);
	free(buf);
	pthread_exit(0);
}
```

复制

原创声明：本文系作者授权腾讯云开发者社区发表，未经许可，不得转载。

如有侵权，请联系 [cloudcommunity@tencent.com](mailto:cloudcommunity@tencent.com) 删除。
