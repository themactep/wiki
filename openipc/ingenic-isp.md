Ingenic IMP
-----------

Preload `libcallback.so` library when launching `majestic`.

`LD_PRELOAD=/usr/lib/libcallback.so /usr/bin/majestic`


### Functions

These ISP functions should become available:

```
IMP_ISP_Tuning_SetAutoZoom(IMPISPAutoZoom *ispautozoom);
IMP_ISP_Tuning_SetSensorFPS(uint32_t fps_num,
IMP_ISP_Tuning_SetAntiFlickerAttr(IMPISPAntiflickerAttr attr);
IMP_ISP_Tuning_SetBrightness(unsigned char
IMP_ISP_Tuning_SetContrast(unsigned char
IMP_ISP_Tuning_SetSharpness(unsigned char
IMP_ISP_Tuning_SetBcshHue(unsigned char
IMP_ISP_Tuning_SetSaturation(unsigned char
IMP_ISP_Tuning_SetISPBypass(IMPISPTuningOpsMode enable);
IMP_ISP_Tuning_SetISPHflip(IMPISPTuningOpsMode mode);
IMP_ISP_Tuning_SetISPVflip(IMPISPTuningOpsMode mode);
IMP_ISP_Tuning_SetISPRunningMode(IMPISPRunningMode mode);
IMP_ISP_Tuning_SetISPCustomMode(IMPISPTuningOpsMode mode);
IMP_ISP_Tuning_SetGamma(IMPISPGamma *gamma);
IMP_ISP_Tuning_SetAeComp(int comp);
IMP_ISP_Tuning_SetAeFreeze(IMPISPTuningOpsMode mode);
IMP_ISP_Tuning_SetExpr(IMPISPExpr *expr);
IMP_ISP_Tuning_SetWB(IMPISPWB *wb);
IMP_ISP_Tuning_SetAwbClust(IMPISPAWBCluster *awb_cluster);
IMP_ISP_Tuning_SetAwbCtTrend(IMPISPAWBCtTrend *ct_trend);
IMP_ISP_Tuning_SetMaxAgain(uint32_t gain);
IMP_ISP_Tuning_SetMaxDgain(uint32_t gain);
IMP_ISP_Tuning_SetVideoDrop(void (*cb)(void));
IMP_ISP_Tuning_SetHiLightDepress(uint32_t strength);
IMP_ISP_Tuning_SetBacklightComp(uint32_t strength);
IMP_ISP_Tuning_SetTemperStrength(uint32_t ratio);
IMP_ISP_Tuning_SetSinterStrength(uint32_t ratio);
IMP_ISP_Tuning_SetAeWeight(IMPISPWeight *ae_weight);
IMP_ISP_Tuning_SetAwbWeight(IMPISPWeight *awb_weight);
IMP_ISP_Tuning_SetWB_ALGO(IMPISPAWBAlgo wb_algo);
IMP_ISP_Tuning_SetAeHist(IMPISPAEHist *ae_hist);
IMP_ISP_Tuning_SetAwbHist(IMPISPAWBHist *awb_hist);
IMP_ISP_Tuning_SetAfHist(IMPISPAFHist *af_hist);
IMP_ISP_Tuning_SetAfWeight(IMPISPWeight *af_weight);
IMP_ISP_Tuning_SetAeMin(IMPISPAEMin *ae_min);
IMP_ISP_Tuning_SetAe_IT_MAX(unsigned int
IMP_ISP_Tuning_SetAeTargetList(IMPISPAETargetList *at_list);
IMP_ISP_Tuning_SetModuleControl(IMPISPModuleCtl *ispmodule);
IMP_ISP_Tuning_SetFrontCrop(IMPISPFrontCrop *ispfrontcrop);
IMP_ISP_Tuning_SetDPC_Strength(unsigned int
IMP_ISP_Tuning_SetDRC_Strength(unsigned int
IMP_ISP_Tuning_SetHVFLIP(IMPISPHVFLIP hvflip);
IMP_ISP_Tuning_SetMask(IMPISPMASKAttr *mask);
IMP_ISP_Tuning_SetAwbCt(unsigned int
IMP_ISP_Tuning_SetCCMAttr(IMPISPCCMAttr *ccm);
IMP_ISP_Tuning_SetAeAttr(IMPISPAEAttr *ae);
IMP_ISP_Tuning_SetScalerLv(IMPISPScalerLv *scaler_level);
IMP_ISP_Tuning_SetDefog_Strength(uint8_t *ratio);
IMP_ISP_Tuning_SetCsc_Attr(IMPISPCscAttr *attr);
IMP_ISP_Tuning_SetWdr_OutputMode(IMPISPWdrOutputMode *mode);
```

### Control

#### Read value
```
echo "video cont" | nc localhost 4000
```

#### Set value
```
echo "video cont 128" | nc localhost 4000
```
