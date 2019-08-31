set_global_assignment -entity "sram" -library "lib_sram" -name IP_TOOL_NAME "Qsys"
set_global_assignment -entity "sram" -library "lib_sram" -name IP_TOOL_VERSION "17.1"
set_global_assignment -entity "sram" -library "lib_sram" -name IP_TOOL_ENV "Qsys"
set_global_assignment -library "lib_sram" -name SPD_FILE [file join $::quartus(sip_path) "../sram.spd"]
set_global_assignment -library "lib_sram" -name MISC_FILE [file join $::quartus(sip_path) "../../sram.qsys"]

set_global_assignment -library "lib_sram" -name MISC_FILE [file join $::quartus(sip_path) "sram.v"]
set_global_assignment -library "lib_sram" -name MISC_FILE [file join $::quartus(sip_path) "submodules/sram_sram_0.v"]
