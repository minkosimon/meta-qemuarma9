FILESEXTRAPATHS_prepend := "${THISDIR}/files:"
SRC_URI += "file://fragment.cfg"


do_deploy_append() {
	# Generate env image
	${B}/tools/mkenvimage -s ${UBOOT_ENV_SIZE} -o ${DEPLOYDIR}/uboot.env ${DEPLOYDIR}/${UBOOT_INITIAL_ENV}

}

