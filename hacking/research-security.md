Access to SSH, telnet, FTP and other services
---------------------------------------------

Very often stock firmware provides access to its operating system but the
access is closed with an undisclosed password. We can recover a cryptographic
hash of that password while extracting a copy of the firmware image.

Usually, password hashes reside in `/etc/password` or in `/etc/shadow` files.
How to determine which one you need? First, look inside `/etc/password`:
```
root:x:0:0:root:/root:/bin/bash
daemon:x:1:1:daemon:/usr/sbin:/usr/sbin/nologin
bin:x:2:2:bin:/bin:/usr/sbin/nologin
hacker:!:666:666:hell:/dev/null:/usr/sbin/nologin
user:$1$bh2njiGH$4duacOMcXDh6myANzbZTf.:1000:1000:/home/user:/bin/sh
guest::9999:9999:guest:/tmp:/bin/jail
...
```
Each line starts with a username followed by a password and other fields 
delimited by semicolons. An empty password field means the account can be 
accessed without any password. An asterisk (`*`) or an exclamation mark (`!`) 
means the account doesn't have any password and no password will access the 
account. While `x` means the password is in `/etc/shadow` file.

### Password hash

```console
$1$bh2njiGH$4duacOMcXDh6myANzbZTf.
```

The hashed salt password string consists of three parts: hashing algorithm
identifier, salt and password hash, each of which is preceded by a dollar sign.
The first part, `$1`, is the hashing algorithm encoded with one (rarely two)
characters. It denotes the cryptographic method used to generate the hash:

- `$1` - MD5 algorithm.
- `$2` - Blowfish algorithm.
- `$2a` - eksblowfish algorithm
- `$5` - SHA-256 algorithm
- `$6` - SHA-512 algorithm

The second part, `$bh2njiGH`, is salt - a character string added to the
plaintext password before hashing it in order to randomize the resulting hashes
for the same password and prevent [rainbow table][1] attacks.

The last part, `$4duacOMcXDh6myANzbZTf.`, is the hash. When you enter a
password, it is concatenated with the provided salt then hashed using the
provided hashing algorithm, and the result is compared to the hash.
The same password, salt and hashing method will always produce the same result.

Hashing algorithms are one-way encryption methods, meaning the hash cannot be
decrypted back to a plaintext password, but it is possible to perform hashing
of available variants of plaintext passwords until the match is found.
This method is called the [brute-force attack][2].

You can use [hash analyzer](https://www.tunnelsup.com/hash-analyzer/) to 
determine the type of hash.

IP cameras tend to utilize a relatively simple and fast MD5 hashing algorithm
so using a password-breaking software and powerful computing resources the
original plaintext password can be picked in a matter of weeks or days, if not
hours, especially using high-quality dictionaries.

In the example above, we used "openipc" for the password. You can check the
validity of the password using either `mkpasswd` or `openssl`:

```bash
$ mkpasswd -m md5crypt -S bh2njiGH openipc
$1$bh2njiGH$4duacOMcXDh6myANzbZTf.
$ openssl passwd -1 -salt bh2njiGH openipc
$1$bh2njiGH$4duacOMcXDh6myANzbZTf.
```

When the password is found, it is wise to share it publicly, so that other
researchers in the field could dedicate their cryptographic resources to
discover even more yet unknown passwords. Sharing is caring, boys!

### Some passwords that we found in different firmware

| Hash                               | Plain text       |
|------------------------------------|------------------|
|                                    | 00000000         |
|                                    | 1111             |
|                                    | 1111111          |
|                                    | 1234             |
|                                    | 12345            |
|                                    | 123456           |
|                                    | 123456asj        |
|                                    | 4uvdzKqBkj.jg    |
|                                    | 54321            |
|                                    | 666666           |
|                                    | 7ujMko0admin     |
|                                    | 7ujMko0vizxv     |
|                                    | 888888           |
|                                    | OxhlwSG8         |
|                                    | S2fGqNFs         |
|                                    | anko             |
|                                    | anni2013         |
|                                    | annie2012        |
|                                    | apix             |
|                                    | avtech97         |
|                                    | cat1029          |
|                                    | cxlinux          |
|                                    | default          |
|                                    | dreambox         |
|                                    | hi3518           |
|                                    | ikwb             |
|                                    | ipc71a           |
|                                    | juantech         |
|                                    | jvbzd            |
|                                    | klv123           |
|                                    | klv1234          |
|                                    | meinsm           |
|                                    | pass             |
|                                    | password         |
|                                    | realtek          |
|                                    | service          |
|                                    | slplzgjipc       |
|                                    | slpmstar         |
|                                    | slprealtek       |
|                                    | smcadmin         |
|                                    | supervisor       |
|                                    | support          |
|                                    | system           |
|                                    | tech             |
|                                    | tlJwpbo6         |
|                                    | ubnt             |
|                                    | user             |
|                                    | vhd1206          |
|                                    | vizxv            |
|                                    | zlxx.            |
| $1$$.MO09JyxBBNd9Xv0pXIqc0         | lbtech2002       |
| $1$$5ICya/hNOkPC33NssbPbs1         | @first!          |
| $1$$5g0YQT0RMSzcGI5qmCiAy.         | jvtsmart123      |
| $1$$6EWLm0KIyyVuSwSFNbVyS/         |                  |
| $1$$8LecoU88mCXdvZAqbWZnn0         |                  |
| $1$$BZofx4soyTd/5HrIQGP5L/         | fxjvt1805        |
| $1$0Me7S3z5$.uQ4Pr/QjJQ/0JUZI0w4m. |                  |
| $1$12345678$CTq8UQyYrE.vbbG7E8Mtj1 |                  |
| $1$4dAkkeWK$HCy0K1z8E.wAuwgLV8bWd/ |                  |
| $1$7BqzlCqK$nQXIfc53c1ACEwzNg7G3D. |                  |
| $1$7bfnUEjV$3ogadpYTDXtJPV4ubVaGq1 | Zte521           |
| $1$EmcmB/9a$UrsXTlmYL/6eZ9A2ST2Yl/ |                  |
| $1$EnVGPLqH$Jwh/FgaqrrHwHsmzHibnc1 | hkipc2016        |
| $1$FMNq4QIj$lJg6WzZxy1HWl3sL.YwIq1 |                  |
| $1$IZfqary9$IrG6loat5pDTBLr6ksKTD0 |                  |
| $1$JYFTech$dt2mZnCIdoFSWAog1s.T41  |                  |
| $1$MoCJ1nRA$NfsI1wlYcWoF5MbU4t3Og0 | ivdev            |
| $1$NhU8N7Bw$tviIe.J4r/RCm5xK/GgP5/ |                  |
| $1$OIKWDzOV$WjZNcNtHSKVscbi9WQcpu/ | root             |
| $1$Qtj8cUMZ$4JhtiYFzOpCzWNI.7433u/ |                  |
| $1$RYIwEiRA$d5iRRVQ5ZeRTrJwGjRy.B0 | xmhdipc          |
| $1$SkeH7JZY$7qZCxNB.GP9n7v63.2bSx. | wabjtam          |
| $1$WhMKHafk$SS6nPXGF4ErcQn6z3wMd8/ | 1234qwer         |
| $1$ZebZnWdY$QZ1Aa.7hwBshCS5k40MUE1 | xc12345          |
| $1$abcdefg$7Ul1XQk3sLRYEGBjGrT9Q/  |                  |
| $1$asdjwjam$DOS2FrIr2xujxIGDVSjd21 | 23we98oi         |
| $1$cNGGWwI/$5/mZTMlcVfJlpE5DGrdsl/ |                  |
| $1$d3VPdE0x$Ztn09cyReJy5Pyn        | runtop10         |
| $1$hDwZFK2z$NLzmlcsiUw2zAe8ol1EcI0 | hipc3518         |
| $1$jv4d1NpW$PpH6Xd79JR1JkUDLMJLch1 | 12345            |
| $1$k1wheY2.$XCelh0nbndpez5N/ER6A00 | _blank password_ |
| $1$lPbKHYLS$r6JMTEm949/hCMv85Fsx9/ |                  |
| $1$ocmTTAhE$v.q2/jwr4BS.20KYshYQZ1 |                  |
| $1$qFa2kfke$vJob19l64Q6n8FvP8/kvJ0 | wabjtam          |
| $1$rHWQwR5V$i4FVDvwhuzau8msvAfHEt. | 2601hx           |
| $1$rmxcrLSF$Pbx3DU0y7W0eKIpAMRX351 |                  |
| $1$rnjbbPTD$tR9oAIWgUp/jRrhjDuUwp0 |                  |
| $1$s8Bhq1gH$2UmLfbcu07nMOdwHkyRYo/ |                  |
| $1$soidjfoi$9klIbmCLq2JjYwKfEA5rH1 |                  |
| $1$tiaLlxGM$byeTUfQgqyET5asfwwNjg0 | hichiphx         |
| $1$uF5XC.Im$8k0Gkw4wYaZkNzuOuySIx/ |                  |
| $1$vN9F.lHa$E09mbCRo70834AUfkytpX. |                  |
| $1$w4uYby9X$MZBZYSSEjhCvwafKv0v2t1 | ivideo           |
| $1$wbAnPk8f$yz0PI9vnyLRmWbENUnce3/ |                  |
| $1$y5hskMvE$Pdm4AgjJjNL5Uk08vgH/h0 |                  |
| $1$yFuJ6yns$33Bk0I91Ji0QMujkR/DPi1 |                  |
| $1$ybdHbPDn$ii9aEIFNiolBbM9QxW9mr0 | hslwificam       |
| $1$yi$FS7W5j1RJmbRHDe0El/zX/       |                  |
| $1$yi$MiivC6pLdwS0zp0pa0cUq1       | qw1234qw         |
| $1$yq01TaSp$lkN/azu3IxE97owy27pve. |                  |
| $6CJlS7VEVeK2                      |                  |
| $Dg.cUjtWGTIVkuFS0ZYbN1            | fx1805           |
| $enWsv2cbxPCrd0WeXUXtX0            | nobody           |
| $qZV4X6DTqMHUDIyZG.8PH.            |                  |
| $z2VkRbfNoE/xHLBj8i2cv.            | ftp              |
| 0.IQvJd8bXSWU                      | hdipc%No         |
| 04h6XLo9zAfEM                      | sl.x.            |
| 7PJZu5rjtntsk                      | HI71323x         |
| 7UZzpRuiyJi7E                      | I81ou812         |
| 7wtxBdUGBnuoY                      | runtop10         |
| 8QYQ7w7.s1xXM                      | HI0605v1         |
| 9B60FC59706134759DBCAEA58CAF9068   | Fireitup         |
| CYjoTKVIDJ0bg                      | tianwang         |
| EeA5H4cQvy0gc                      |                  |
| FCb/N1tGGXtP6                      | 059AnkJ          |
| GIgEh3ZZNHRh2                      | IPCam@sw         |
| LHjQopX4yjf1Q                      | ls123            |
| LOra.53O7nLVQ                      | ak47agai         |
| ShRCX9PD3xxus                      | Ubia#180         |
| Sk.MffUl2mnm2                      | 123              |
| Uu1Kq8MmXhxqA                      | j1/_6s*w         |
| X.pOwnufFAWYQ                      | ccadmin          |
| Z2eoH2SgzVIfA                      | jvth6cs2         |
| a03e3thxwWU0g                      | /*6.=_ja         |
| aVG8.5PMEOfnQ                      | WYom2020         |
| ab8nBoH3mb8.g                      | helpme           |
| absxcfbgXtb3o                      | xc3511           |
| esPcWTdhAJX8o                      | LKFmii10         |
| fRW5anhWEAGwY                      | 1.oN%cpi         |
| hbJdVywKWttVM                      | e177ab8e         |
| xt5USRjG7rEDE                      | j1/_7sxw         |
| z1YC93pV6OlQI                      | ExVmGaVy         |
| rJ0FHsG0ZbyZo                      | ismart12         |
| U3w5K84Y9u88U                      | Al19!@           |


##### SHA-256

| Hash                                                            | Plain text |
|-----------------------------------------------------------------|------------|
| $5$xjY0o85dbuqsAZ2h$t9EeQkJLH0OT5/W1CQcy812YTiJmwtSuI1z2VDb1QV2 |            |
| $5$pb8nYpk/xxu/fjxv$9joq616ABjUVuJFm3ZnIXwdKkbWDViQpnCMv60KRHH6 |            |

##### SHA-512

| Hash                                                                                                       | Plain text |
|------------------------------------------------------------------------------------------------------------|------------|
| $6$4GbqAXEFqeauykeE$a6dqh2CoO6SucAplB/b4uvS5z0hN1Cb2r1pNWpsXL96vMqrrY42lFylXGNJm6RcY.3Lte/QS2.yyI4/pZDHAa1 |            |
| $6$hmsgateway$A4aIJTn05K9yAgy7tAnw6hxPUn3xpwlTPlb8El8LCbTpq9THjqr4Q5CsWkNYgR6uYMI0lHyH5N6eqiNBJCVEY0       |            |
| $6$s90ReNRC.jPq3V9Z$oMWkGeVCuBFY/Ey3DS8NxOK2tPD6eFIRxWNaxZx8EhY9aTNzgqM7tSxl.PngyNyYJT06RP8iE3Bd04CuicNiq. |            |
| $6$wyzecampan$iH01lm9SqCfUrc4.Jjp3BLUErTGiiB.pBk/60XuPYxQo7uZIoBjwUrCcoGeesbTa1EP5N/DC1a/GOMVW8qUVY1       |            |
| $6$wyzecampanv3$XYNa9HBlTpHg878e3GAckLngvkbs1ndm6YXlTqfxjchAvh2zpzyjtbg4BSvd2cM/dgGx7.FwQEcCbxAg9ODGf1     |            |
| $6$wyzecamv3$8gyTEsAkm1d7wh12Eup5MMcxQwuA1n1FsRtQLUW8dZGo1b1pGRJgtSieTI02VPeFP9f4DodbIt2ePOLzwP0WI0        |            |
| $6$wyzedoorbellv2$ha0gh/xUdVLSI6l/4ARLpUmKteW.EuR8PaDcft8ZWfVISzK5yx61nygR08pUZcawc4RITvyfR.cQeMyvme4Gm1   |            |



### Hijacking the default password
> _tested on Goke_

Over the UART interface, it is possible to temporarily interrupt the normal
booting sequence and drop into a limited Linux shell at the early stage of
system startup.

```
setenv bootargs ${bootargs} single init=/bin/sh
boot
```

This shell won't load the full working system, so you have to amend it manually.
First, mount `/rom` filesystem:

```
mount -t jffs2 /dev/mtdblock3 /rom
```

Mount the rest of mounting points from `/etc/fstab`:

```
mount -a
```

Also mount the SD card to copy files to and from:

```
mount /dev/mmcblk0p1 on /mnt/s0
```

On `/rom` filesystem, you can edit the `/room/etc/passwd` file but once the
device restarts it will be reset to default. This happens because there is a
guide bin file recreating `passwd` file on each start, so we need to modify
that executable.

Copy `system.dat` to an SD card:

```
cp /rom/system.dat /mnt/s0
```

On a linux computer, unpack `system.dat` file using `unsquashfs`:

```
mkdir squashfs-temp
cd squashfs-temp
unsquashfs system.dat
```

Find guide file and edit its content in a hex-editor to modify the name of the
file where the password is written on every restart. Search for `/etc/passwd` 
and change a letter in its name to something different, like `/etc/passwT`.

Pack the squash file system using `mksquashfs`:

```bash
mksquashfs ./squashfs-root ./file -comp xz -no-xattrs -noappend -no-exports -all-root -quiet -b 131072
```

and copy it from the SD card back to `/rom` directory on the camera.

Now you can replace the password in `/rom/etc/passwd` with your own password, 
and when you restart the device, you will have full working system with your 
own password.

### Software

- [Hashcat](https://hashcat.net/)
- [John The Ripper](https://www.openwall.com/john/)
- [Hydra](https://github.com/vanhauser-thc/thc-hydra)

[1]: https://en.wikipedia.org/wiki/Rainbow_table
[2]: https://en.wikipedia.org/wiki/Brute-force_attack
