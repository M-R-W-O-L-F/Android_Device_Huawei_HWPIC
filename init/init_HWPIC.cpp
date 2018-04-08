#include <cstdlib>
#include <fstream>
#include <string>

#include "vendor_init.h"
#include "property_service.h"
#include "log.h"
#include "util.h"

#include "init_hi6250.h"

void init_target_properties()
{
    std::ifstream fin;
    std::string buf;

    std::string platform = property_get("ro.board.platform");
    if (platform != ANDROID_TARGET) {
	return;
    }

    fin.open("/sys/firmware/devicetree/base/hisi,product_name");
    while (std::getline(fin, buf, ' '))
        if ((buf.find("PIC-AL00") != std::string::npos) || (buf.find("PIC-TL00") != std::string::npos) || (buf.find("PIC-LX9") != std::string::npos) || (buf.find("PIC-L09") != std::string::npos) || (buf.find("PIC-L29") != std::string::npos))
            break;
    fin.close();

    if (buf.find("PIC-AL00") != std::string::npos) {
        property_set("ro.product.model", "PIC-AL00");
    }
    else if (buf.find("PIC-TL00") != std::string::npos) {
        property_set("ro.product.model", "PIC-TL00");
    }
    else if (buf.find("PIC-LX9") != std::string::npos) {
        property_set("ro.product.model", "PIC-LX9");
        property_set("ro.build.description", "PIC-LX9-user 7.0 HUAWEIPIC-LX9 C10B150 release-keys");
        property_set("ro.build.fingerprint", "HUAWEI/PIC-LX9/HWPIC:7.0/HUAWEIPIC-LX9/C10B150:user/release-keys");
    }
    else if (buf.find("PIC-L09") != std::string::npos) {
        property_set("ro.product.model", "PIC-L09");
    }
    else if (buf.find("PIC-L29") != std::string::npos) {
        property_set("ro.product.model", "PIC-L29");
    }
    else {
	property_set("ro.product.model", "UNKNOWN");
    }
}