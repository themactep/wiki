
### Cloner

https://github.com/Ingenic-community/Cloner/releases

Extra config for a camera with T31X SoC and 16MB NOR flash chip
that will flash full 16MB image in one go:

```
[ddr]
bank8=1
creator_version=1
cs0=1
cs1=0
current_ddr=M14D1G1664A_DDR2.cfg
current_type="4,DDR2"
dw32=0

[debug]
boot_stage_send_length=1
cpu_info_length=8
log=0
read_back_chk=0
stage2_init_timeout=200
str_to_hex=-1
transfer_data_chk=0
transfer_size=65536
uart_burn_baudrate=921600
uart_transfer_size=32768

[gpio]
config="-1,-1,0,"

[info]
baud_rate=115200
complete=31
count=56
cpu_and_ddr_freq_limit_index=0
cpufreq=576000000
ddrfreq=400000000
extal=24000000
force_reset=0
power_off=0
sync_time=0
uart_gpio=1

[policy]
policy_count=2

[policy0]
attribute=est.nor
enabled=0
label=test
offset=0x0
ops="12,6,0"
type=11

[policy1]
attribute=ac2_1.bin
enabled=1
label=boot
offset=0x0
ops="12,6,0"
type=0

[sfc]
blocksize=65536
boot_quad=0
burn_quad=0
download_params=0
force_erase=0
reserve_space=0
sfc_frequency=-1

[spiPartition]
Partition0="boot,0x0,0x1000000,0,MTD_MODE"
count=1
```
