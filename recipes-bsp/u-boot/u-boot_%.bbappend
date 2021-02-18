FILESEXTRAPATHS_prepend := "${THISDIR}/files:"
SRC_URI += "file://fragment.cfg \
            file://0001-Configure-u-boot-default-configurations-to-enable-du.patch \
            "


do_deploy_append() {
	# Generate env image
	${B}/tools/mkenvimage -s ${UBOOT_ENV_SIZE} -o ${DEPLOYDIR}/uboot.env ${DEPLOYDIR}/${UBOOT_INITIAL_ENV}

}

