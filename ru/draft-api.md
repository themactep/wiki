Мысли об API
============

Обращение через GET возвращает значение параметра.

Обращение через POST устанавливает значение параметра.

Для всех запросов обязательным параметром является api-key,
по которому происходит авторизация.

```
/audio
	api-key			{string}!
	enabled			{boolean}
	volume			{number}
	sampling-rate		{number}
	codec			[mp3,opus,pcm,alaw,ulaw]
	card			{string}
/system
	api-key			{string}!
	hostname		{string}
	loglevel		[trace,debug,info,warn,error]
	sensor-config-path	{string}
	sensor-configs-dir	{string}
	www-home-dir		{string}
	http-port		{number}
	https-port		{number}
	ssl-cert-path		{string}
	ssl-key-path		{string}
	updates-channel		[stable,beta]
	max-buffer-size		{number}
/image
	api-key			{string}!
	flip			{boolean}
	mirror			{boolean}
	rotate			[0,90,270]
	contrast		{number}
	hue			{number}
	saturatuon		{number}
	luminance		{number}
/isp
	api-key			{string}!
	memory-mode		[normal,reduction]
	slow-shutter		[disabled,low,medium,high]
	anti-flicker		[disabled,50,60]
	align-width		{number}
	block-count		{number}
	thread-stack-size	{number}
	sensor-exposure-time	{number}
	sensor-again		{number}
	sensor-dgain		{number}
	isp-gain		{number}
	drc-rate		{number}
/jpeg
	api-key			{string}!
	enabled			{boolean}
	resolution		{string}
	quality			{number}
	progressive		{boolean}
/mjpeg
	api-key			{string}!
	enabled			{boolean}
	resolution		{string}
	framerate		{number}
	bitrate			{number}
/motiondetect
	api-key			{string}!
	enabled			{boolean}
	profile			[indoor,outdoor]
	visualize		{boolean}
	debugging		{boolean}
	roi			{string}
/nightmode
	api-key			{string}!
	enabled			{boolean}
	light-gpio-pin		{number}
	ircut-gpio-pin1		{number}
	ircut-gpio-pin2		{number}
	ircut-delay		{number}
	drc-rate		{number}
	mode			[on/off/toggle]
/osd
	api-key			{string}!
	enabled			{boolean}
	font-file-path		{string}
	template		{string}
	position-x		{number}
	position-y		{number}
	privacy-masks		{string}
/raw
	api-key			{string}!
	enabled			{boolean}
	mode			[slow,fast,none]
/video
	api-key			{string}!
	channel			[0,1]!
	codec			[h264,h265]
	resolution		{string}
	framerate		{number}
	bitrate			{number}
	keyframe-second		{number}
	gop-mode		[normal,dual,smart]
	rc-mode			[avbr]
	crop			{string}
/watchdog
	api-key			{string}!
	enabled			{boolean}
	timeout			{number}
```

