FILESEXTRAPATHS_prepend := "${THISDIR}/files:"
SRC_URI += "file://fragment.cfg \
            file://0001-Configure-u-boot-default-configurations-to-enable-du.patch \
            "

#DEPENDS = "u-boot-mkimage-native"

#INHIBIT_DEFAULT_DEPS = "1"

#do_compile_append() {
#
#	bbplain "===================================================="
#	bbplain "=             COMPILE boot.scr                     ="
#	bbplain "===================================================="
#
#	bbplain "UBOOT_ARCH = ${UBOOT_ARCH}"
#
# 	${B}/tools/mkimage -A arm -T script -C none -n "Boot script" -d "${WORKDIR}/boot.cmd" ${DEPLOYDIR}/boot.scr
#	
#}

do_deploy_append() {
	# Generate env image
	${B}/tools/mkenvimage -s ${UBOOT_ENV_SIZE} -o ${DEPLOYDIR}/uboot.env ${DEPLOYDIR}/${UBOOT_INITIAL_ENV}

}

