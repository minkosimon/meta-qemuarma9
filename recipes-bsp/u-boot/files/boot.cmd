test -n "${bank}" || setenv bank "a"


if test ${bank} = a;then 
	echo SIMON Booting Bank A 
	setenv bootargs console=ttyAMA0 root=/dev/mmcblk0p2
	setenv kernel_boot kernel_a
	setenv dtb_boot dtb_a
else
	echo SIMON Booting Bank B
	setenv bootargs console=ttyAMA0 root=/dev/mmcblk0p3
	setenv kernel_boot kernel_b
	setenv dtb_boot dtb_b
fi

setenv kernel_boot kernel_a
setenv dtb_boot dtb_a
saveenv
ext4load mmc 0:1 0x60100000 ${kernel_boot}
ext4load mmc 0:1 0x62000000 ${dtb_boot}
bootz 0x60100000 - 0x62000000