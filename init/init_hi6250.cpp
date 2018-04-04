#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <sys/stat.h>
#include <sys/types.h>

#include "vendor_init.h"
#include "property_service.h"
#include "log.h"
#include "util.h"

#include "init_hi6250.h"

__attribute__ ((weak))
void init_target_properties()
{
}

void vendor_load_properties()
{
    init_target_properties();
}