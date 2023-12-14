Ingenic IMP Control library
---------------------------
https://github.com/gtxaspec/libimp_control

### Usage

Preload `libimp_control.so` library when launching `majestic`:

```
LD_PRELOAD=/usr/lib/libimp_control.so /usr/bin/majestic
```

#### Read value

```
echo "video cont" | nc localhost 4000
```

#### Set value

```
echo "video cont 128" | nc localhost 4000
```

Ingenic T20 has an abridged version of the lib, the following functions are not
supported on the SoC: 

```
IMP_ISP_Tuning_GetDefog_Strength
IMP_Encoder_SetChnGopAttr
IMP_ISP_Tuning_SetBcshHue
IMP_Encoder_GetChnGopAttr
IMP_AI_SetAlcGain
IMP_ISP_Tuning_GetFrontCrop
IMP_AI_GetAlcGain
IMP_ISP_Tuning_GetAeAttr
IMP_ISP_Tuning_SetMask
IMP_ISP_Tuning_SetDefog_Strength
IMP_ISP_Tuning_GetAE_IT_MAX
IMP_ISP_Tuning_SetDPC_Strength
IMP_ISP_Tuning_GetAWBCt
IMP_ISP_Tuning_GetBacklightComp
IMP_ISP_Tuning_SetAutoZoom
IMP_ISP_Tuning_SetFrontCrop
IMP_ISP_Tuning_SetBacklightComp
IMP_ISP_Tuning_GetDRC_Strength
IMP_Encoder_SetChnQpIPDelta
IMP_ISP_Tuning_GetAeLuma
IMP_Encoder_SetChnGopLength
IMP_ISP_Tuning_SetDRC_Strength
IMP_ISP_Tuning_GetAeMin
IMP_Encoder_SetChnQp
IMP_Encoder_SetChnBitRate
IMP_Encoder_SetChnQpBounds
IMP_ISP_Tuning_SetAe_IT_MAX
IMP_ISP_Tuning_GetMask
IMP_ISP_Tuning_SetAeMin
IMP_ISP_Tuning_GetBcshHue
IMP_ISP_Tuning_GetDPC_Strength
```
