Ingenic CPU Technologies
------------------------
http://www.ingenic.com.cn/en/?xburst.html

From the 1980s on, the CPU technologies, in the respect of chip products as well as IP cores,
were increasingly monopolized. Intel and AMD have been controlling the computer industry with
their X86 CPUs for over 30years, while ARM has been taking a lion’s share of the CPU IP core 
licensing market since the start of this century thanks to the great success of smart phones.

Ingenic’s R&D team of CPU has been working hard for years to pave a way out through the monopoly
of X86 and ARM. To do that, we must provide not only better PPA(Performance, Power Consumption 
and Area of Wafers) but also better compute architecture which can better work together with AI 
and which can better meet the compute needs from Internet of Things.

### XBurst Family CPU Cores (based on MIPS ISA)

Ingenic's first endeavor and achievement, which was based on the MIPS ISA, was the XBurst CPU. 
More than based on the basic MIPS ISA, XBurst CPU incorporated DSA (Domain Specific Architecture) 
with Multimedia and AI Compute as the target applications. With the micro architecture of the CPU
being designed innovatively, the CPU has much better PPA performance than existing 32bit CPU cores.
Moreover, armed with the DSA which has been optimized for Multimedia and AI applications, 
XBurst works better in such areas.

|                    | XBurst1               | XBurst2                |
|--------------------|-----------------------|------------------------|
| Base ISA           | MIPS32 R5             | MIPS32 R5              |
| SIMD Extension     | MXU2.0 - 128bits SIMD | MSA128 - 128bits SIMD  |
|                    |                       | MXA128 - 128bits SIMD  |
|                    |                       | MXU3.0- 512bits SIMD   |
| Micro-Architecture | 9 stage pipeline      | Dual-Issue In-Order    |
|                    | Single issue          | 2 Hardware Threads SMT |
| Coremark           | 2.3                   | 3.6 (single thread)    |
| Power Consumption  | 0.07mW/MHz, 40nm      | 0.13mW/MHz, 28nm       |

### Downloads

- [XBurst1 CPU Core Programming Manual][1]     
- [XBurst1 Instruction Set Architecture MIPS extension/enhanced Unit 2][2]    
- [XBurst2 CPU Core Programming Manual][3]     
- [XBurst Instruction Set Architecture MIPS eXtended Architecture Programming Manual][4]  

[1]: dox/XBurst1_Core_PM.pdf
[2]: dox/XBurst1_ISA_MXU2.pdf
[3]: dox/XBurst2_Core_PM.pdf
[4]: dox/XBurst2_ISA_MXA128.pdf
