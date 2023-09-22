# [Ingenic T31 Application Development][toc]

Echo Cancellation
-----------------

### What is echo cancellation?

#### Simplex Mode & Half Duplex Mode

If your device is in these two modes, you generally don't need to think about echo cancellation troubles.

The audio inputs audio data through the MIC header, and then the audio data is propagated out through the speakers.

If it's just one device on your side, then well, there's less need for echo cancellation, 
because when you transmit audio data to the MIC header, you don't propagate the audio data
out through the speakers until after you've finished the transmission, so at that point, 
you're not generally bothered by echo.

### Full duplex mode

In Instant Messaging applications, it is necessary to carry out real-time voice communication between two parties,
or more than one party, in the more demanding occasions, usually using an external speaker playback, which will 
inevitably produce echoes, i.e. After a party speaks, it is played through the other party's speaker, and then 
it is captured by the other party's Mic and transmitted back to itself. If the echo is not processed, it will 
affect the call quality and user experience, the more serious will also form a vibration, resulting in whistling.

Realization principle:

Echo cancellation is the process of eliminating the sound played from the local speakers from the sound data
captured by the Mic after the Mic has captured the sound, so that the only sound recorded by the Mic is the 
sound of the local user speaking.


### Ingenic's Echo Elimination

Junzheng's echo cancellation uses two main API functions, one of which is the

#### Start echo cancellation

```
ret = IMP_AI_EnableAec(devID, chnID, 0, 0);
if(ret != 0) {
    IMP_LOG_ERR(TAG, "Audio Record enable channel failed\n");
    return NULL;
}
```

#### End echo cancellation

```
ret = IMP_AI_DisableAec(devID, chnID);
if(ret != 0) {
    IMP_LOG_ERR(TAG, "IMP_AI_DisableAecRefFrame\n");
    return NULL;
}
```

### Ingenic's Complete Echo Cancellation Code

```
static void * IMP_Audio_Record_AEC_Thread(void *argv)
{
    int ret = -1;
    int record_num = 0;

    if(argv == NULL) {
        IMP_LOG_ERR(TAG, "Please input the record file name.\n");
        return NULL;
    }

    FILE *record_file = fopen(argv, "wb");
    if(record_file == NULL) {
        IMP_LOG_ERR(TAG, "fopen %s failed\n", AUDIO_RECORD_FILE);
        return NULL;
    }

    /* set public attribute of AI device. */
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

    /* enable AI device. */
    ret = IMP_AI_Enable(devID);
    if(ret != 0) {
        IMP_LOG_ERR(TAG, "enable ai %d err\n", devID);
        return NULL;
    }

    /* set audio channel attribute of AI device. */
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

    /* enable AI channel. */
    ret = IMP_AI_EnableChn(devID, chnID);
    if(ret != 0) {
        IMP_LOG_ERR(TAG, "Audio Record enable channel failed\n");
        return NULL;
    }

    ret = IMP_AI_EnableAec(devID, chnID, 0, 0);
    if(ret != 0) {
        IMP_LOG_ERR(TAG, "Audio Record enable channel failed\n");
        return NULL;
    }

    /* Set audio channel volume. */
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

    int aigain = 20;
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
        /* get audio record frame. */

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

        /* Save the recording data to a file. */
        fwrite(frm.virAddr, 1, frm.len, record_file);

        /* release the audio record frame. */
        ret = IMP_AI_ReleaseFrame(devID, chnID, &frm);
        if(ret != 0) {
            IMP_LOG_ERR(TAG, "Audio release frame data error\n");
            return NULL;
        }

        if(++record_num >= AUDIO_RECORD_NUM)
            break;
    }

    ret = IMP_AI_DisableAec(devID, chnID);
    if(ret != 0) {
        IMP_LOG_ERR(TAG, "IMP_AI_DisableAecRefFrame\n");
        return NULL;
    }
    sleep(3);
    ret = IMP_AI_DisableChn(devID, chnID);
    if(ret != 0) {
        IMP_LOG_ERR(TAG, "Audio channel disable error\n");
        return NULL;
    }

    /* disable the audio devices. */
    ret = IMP_AI_Disable(devID);
    if(ret != 0) {
        IMP_LOG_ERR(TAG, "Audio device disable error\n");
        return NULL;
    }

    fclose(record_file);
    pthread_exit(0);
}
```

[toc]: index.md
