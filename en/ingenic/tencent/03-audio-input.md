# [Ingenic T31 Application Development][toc]

Audio Inputs
------------

### T31 chip audio support functions

The audio function contains ** audio input, audio output, echo cancellation, audio encoding and audio decoding ** 5 modules.

Among them, the concepts of Device and Channel exist for Audio Input and Audio Output. A MIC is considered as a Device, while a MIC can have multiple Channel inputs. Similarly, a SPK is considered as a playback Device, and a SPK can also have multiple Channel outputs. The current version of the Audio API only supports one Channel per Device (T31 only has one input and one output).

The echo cancellation is located in the Audio Input interface and is described in the Function Description.


### Mainstream audio formats and audio formats supported by T31


#### Mainstream audio formats: (audio formats commonly used in audio and video)

**PCM:** The original audio data stream from most of the chips.

**G711A&amp; G711U:**

G711 is a set of voice compression standards customized by the International Telecommunication Union ITU-T, which represents a logarithmic PCM (logarithmic pulse-code modulation) sampling standard, mainly used for telephony. It mainly samples audio with pulse-code modulation at a sampling rate of 8k per second. It utilizes a 64Kbps uncompressed channel to transmit the voice signal. The starting compression ratio is 1:2, i.e., 16-bit data is compressed into 8-bit.G.711 is the dominant waveform sound codec.

There are two main compression algorithms under the G.711 standard. One is the u-law algorithm (also known as often u-law, ulaw, mu-law), which is mainly used in North America and Japan; the other is the A-law algorithm, which is mainly used in Europe and other parts of the world. Among them, the latter is especially designed to facilitate computer processing

The content of G711 is to encode the 14bit (uLaw) or 13bit (aLaw) sampled PCM data into an 8bit data stream, and then reduce the 8bit data to 14bit or 13bit for playback. Unlike MPEG, which considers the whole or a section of the data and then encodes and decodes it, G711 is a waveform. G711 is a waveform codec algorithm, that is, a sample corresponds to a code, so the compression ratio is fixed as:

8/14 = 57% (uLaw)

8/13 = 62% (aLaw) Simply understood, G.711 is a non-linear quantization of the analog signal of the voice, bitrate is 64kbps

**AAC:** AAC

AAC, full Advanced Audio Coding, Chinese name: Advanced Audio Coding, is a file compression format designed for sound data. Unlike MP3, it uses a new algorithm for encoding, which is more efficient and has a higher "cost-effective". Utilizing the AAC format can make people feel that there is no significant reduction in sound quality under the premise of more compact. Apple iPod, Nokia cell phones support AAC format audio files.


#### T31 Currently Supported Audio Formats

Audio encoding The current audio API supports PT_G711A, PT_G711U and PT_G726 format audio encoding.

If you need to add a new encoding method, you need to register the encoder.

The current audio API supports PT_G711A, PT_G711U and PT_G726 format audio decoding.

If you need to add a new decoding method, you need to register a decoder.


### Code Framework Flowchart

Below, we draw the flowchart of the system: the process diagram of audio acquisition.

MIC refers to the thing with the microphone, used to capture the external sound into the collection of analog signals into the T31 chip into digital signals, and then saved in a certain format into a file down.

! [](assets/net-img-a79f34e26b27b7b50b6c5b9b9d099051-20230919120046-iemjt81.png)


### Code Practice

Ingenic T31 SDK inside the sample provided, about how to get audio bare data from the T31 chip, and save the code to flash.

There are several functions inside that need to be focused on:


#### Creating threads

**_ai_basic_record_test_thread:** All our operations are run inside this thread, you can understand it as a task.


#### Setting audio input device properties

**IMP_AI_SetPubAttr：**

```
    int devID = 1;                                           //devID:0: digital MIC, 1: represents the analog MIC
    IMPAudioIOAttr attr;
    attr.samplerate = AUDIO_SAMPLE_RATE_16000;               //Audio sampling rate of 16000
    attr.bitwidth = AUDIO_BIT_WIDTH_16;                      //16-bit audio sampling precision
    attr.soundmode = AUDIO_SOUND_MODE_MONO;                  //mono mode
    attr.frmNum = 40;                                        //Number of cached frames 
    attr.numPerFrm = 640;                                    //Number of sampling points per frame
    attr.chnCnt = 1;                                         //Number of supported channels
    ret = IMP_AI_SetPubAttr(devID, &attr);
```

#### Getting the Raw Audio Segment Data

```
/* Step 6: get audio record frame. */
/* Use this interface before using IMP_AI_GetFrame, and when the interface is successfully called,
   it means that the audio data has been prepared and you can use IMP_AI_GetFrame to get the audio data.
   data has been prepared, you can use IMP_AI_GetFrame to get the audio data.*/

ret = IMP_AI_PollingFrame(devID, chnID, 1000);
if (ret != 0 ) {
    IMP_LOG_ERR(TAG, "Audio Polling Frame Data error\n");
}

/* 
 * @param[in] audioDevId Audio device number.
 * @param[in] aiChn Audio input channel number.
 * @param[out] frm Pointer to the audio frame structure.
 * @param[in] block Blocking/non-blocking identification.
 */

IMPAudioFrame frm;
ret = IMP_AI_GetFrame(devID, chnID, &frm, BLOCK);
if(ret != 0) {
    IMP_LOG_ERR(TAG, "Audio Get Frame Data error\n");
    return NULL;
}

/* Step 8: release the audio record frame. */

ret = IMP_AI_ReleaseFrame(devID, chnID, &frm);
if(ret != 0) {
    IMP_LOG_ERR(TAG, "Audio release frame data error\n");
    return NULL;
}
```

### Demo program for Ingenic's original SDK


```
/*
 * Ingenic IMP AI implement.
 *
 * Copyright (C) 2017 Ingenic Semiconductor Co.,Ltd
 *
 */

#include <unistd.h>
#include <sys/ioctl.h>
#include <sys/prctl.h>
#include <string.h>
#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <stdint.h>
#include <errno.h>
#include <pthread.h>
#include <semaphore.h>
#include <fcntl.h>
#include <sys/time.h>

#include <imp/imp_audio.h>
#include <imp/imp_log.h>
#define TAG "Sample-AI"


#define AI_BASIC_TEST_RECORD_FILE "ai_lbb.pcm"
#define AI_BASIC_TEST_RECORD_NUM 600

static void *_ai_basic_record_test_thread(void *argv)
{
    int ret = -1;
    int record_num = 0;

    FILE *record_file = fopen(AI_BASIC_TEST_RECORD_FILE, "wb");
    if(record_file == NULL) {
        IMP_LOG_ERR(TAG, "fopen %s failed\n", AI_BASIC_TEST_RECORD_FILE);
        return NULL;
    }

    /* Step 1: set public attribute of AI device. */
    int devID = 1;
    IMPAudioIOAttr attr;
    attr.samplerate = AUDIO_SAMPLE_RATE_16000;
    attr.bitwidth = AUDIO_BIT_WIDTH_16;
    attr.soundmode = AUDIO_SOUND_MODE_MONO;
    attr.frmNum = 40;
    attr.numPerFrm = 640;
    attr.chnCnt = 1;
    ret = IMP_AI_SetPubAttr(devID, &attr);
    if(ret != 0) {
        IMP_LOG_ERR(TAG, "set ai %d attr err: %d\n", devID, ret);
        return NULL;
    }

    memset(&attr, 0x0, sizeof(attr));
    ret = IMP_AI_GetPubAttr(devID, &attr);
    if(ret != 0) {
        IMP_LOG_ERR(TAG, "get ai %d attr err: %d\n", devID, ret);
        return NULL;
    }

    IMP_LOG_INFO(TAG, "Audio In GetPubAttr samplerate : %d\n", attr.samplerate);
    IMP_LOG_INFO(TAG, "Audio In GetPubAttr   bitwidth : %d\n", attr.bitwidth);
    IMP_LOG_INFO(TAG, "Audio In GetPubAttr  soundmode : %d\n", attr.soundmode);
    IMP_LOG_INFO(TAG, "Audio In GetPubAttr     frmNum : %d\n", attr.frmNum);
    IMP_LOG_INFO(TAG, "Audio In GetPubAttr  numPerFrm : %d\n", attr.numPerFrm);
    IMP_LOG_INFO(TAG, "Audio In GetPubAttr     chnCnt : %d\n", attr.chnCnt);

    /* Step 2: enable AI device. */
    ret = IMP_AI_Enable(devID);
    if(ret != 0) {
        IMP_LOG_ERR(TAG, "enable ai %d err\n", devID);
        return NULL;
    }

    /* Step 3: set audio channel attribute of AI device. */
    int chnID = 0;
    IMPAudioIChnParam chnParam;
    chnParam.usrFrmDepth = 40;
    ret = IMP_AI_SetChnParam(devID, chnID, &chnParam);
    if(ret != 0) {
        IMP_LOG_ERR(TAG, "set ai %d channel %d attr err: %d\n", devID, chnID, ret);
        return NULL;
    }

    memset(&chnParam, 0x0, sizeof(chnParam));
    ret = IMP_AI_GetChnParam(devID, chnID, &chnParam);
    if(ret != 0) {
        IMP_LOG_ERR(TAG, "get ai %d channel %d attr err: %d\n", devID, chnID, ret);
        return NULL;
    }

    IMP_LOG_INFO(TAG, "Audio In GetChnParam usrFrmDepth : %d\n", chnParam.usrFrmDepth);

    /* Step 4: enable AI channel. */
    ret = IMP_AI_EnableChn(devID, chnID);
    if(ret != 0) {
        IMP_LOG_ERR(TAG, "Audio Record enable channel failed\n");
        return NULL;
    }

    /* Step 5: Set audio channel volume. */
    int chnVol = 60;
    ret = IMP_AI_SetVol(devID, chnID, chnVol);
    if(ret != 0) {
        IMP_LOG_ERR(TAG, "Audio Record set volume failed\n");
        return NULL;
    }

    ret = IMP_AI_GetVol(devID, chnID, &chnVol);
    if(ret != 0) {
        IMP_LOG_ERR(TAG, "Audio Record get volume failed\n");
        return NULL;
    }
    IMP_LOG_INFO(TAG, "Audio In GetVol    vol : %d\n", chnVol);

    int aigain = 28;
    ret = IMP_AI_SetGain(devID, chnID, aigain);
    if(ret != 0) {
        IMP_LOG_ERR(TAG, "Audio Record Set Gain failed\n");
        return NULL;
    }

    ret = IMP_AI_GetGain(devID, chnID, &aigain);
    if(ret != 0) {
        IMP_LOG_ERR(TAG, "Audio Record Get Gain failed\n");
        return NULL;
    }
    IMP_LOG_INFO(TAG, "Audio In GetGain    gain : %d\n", aigain);

    while(1) {
        /* Step 6: get audio record frame. */

        ret = IMP_AI_PollingFrame(devID, chnID, 1000);
        if (ret != 0 ) {
            IMP_LOG_ERR(TAG, "Audio Polling Frame Data error\n");
        }
        IMPAudioFrame frm;
        ret = IMP_AI_GetFrame(devID, chnID, &frm, BLOCK);
        if(ret != 0) {
            IMP_LOG_ERR(TAG, "Audio Get Frame Data error\n");
            return NULL;
        }

        printf("seq = %d,timeStamp = %lld\n",frm.seq,frm.timeStamp);

        /* Step 7: Save the recording data to a file. */
        fwrite(frm.virAddr, 1, frm.len, record_file);

        /* Step 8: release the audio record frame. */
        ret = IMP_AI_ReleaseFrame(devID, chnID, &frm);
        if(ret != 0) {
            IMP_LOG_ERR(TAG, "Audio release frame data error\n");
            return NULL;
        }

        if(++record_num >= AI_BASIC_TEST_RECORD_NUM)
            break;
    }
    sleep(3);
    /* Step 9: disable the audio channel. */
    ret = IMP_AI_DisableChn(devID, chnID);
    if(ret != 0) {
        IMP_LOG_ERR(TAG, "Audio channel disable error\n");
        return NULL;
    }

    /* Step 10: disable the audio devices. */
    ret = IMP_AI_Disable(devID);
    if(ret != 0) {
        IMP_LOG_ERR(TAG, "Audio device disable error\n");
        return NULL;
    }

    fclose(record_file);
    pthread_exit(0);
}

int main(void)
{
    int ret = -1;
    pthread_t record_thread_id;
    printf("[INFO] Test 1: Start audio record test.\n");
    printf("[INFO]        : Can create the %s file.\n", AI_BASIC_TEST_RECORD_FILE);
    printf("[INFO]        : Please input any key to continue.\n");
    getchar();

    /* Step 1: Start audio recording thread. */
    ret = pthread_create(&record_thread_id, NULL, _ai_basic_record_test_thread, NULL);
    if(ret != 0) {
        IMP_LOG_ERR(TAG, "[ERROR] %s: pthread_create Audio Record failed\n", __func__);
        return -1;
    }
    pthread_join(record_thread_id, NULL);
    return 0;
}
```

[toc]: index.md
