**The Tokaled**

Starting from The Tokamak Model of Steven Wray (https://www.thingiverse.com/thing:3264356) during first pandemic lockdown
born the Tokaled controlled via arduino and a raspeberry pi running THe MARTe2 framework using data coming from the Glorious FTU Tokamak Experiment DataBase:
 
Construction Phase: https://www.thingiverse.com/make:964760

For the plasma I ve used a transparent tube rolled up like a helicoid, filled
with an rgb strip and connect for it the Blue light, PF coils are green, CS is RED and is a chromed pipe of my toilet, TF is White.

To assemble it, I had to collapse all the TF coils togheter, put the plasma tube inside and roll it (helicoid) than I expand again the TF Coils and I put all on the base


Operatin Phase: https://www.thingiverse.com/make:964745

Thera are several Configuration Files with different MARTe2 components to realize differnt Features, 

The lights are proportional to the modules of the currents flowing in an FTU experiment.

**A Brief List of HW/SW**

Hardware:
- Rpi2 or better
- picam (not mandatory)
- Arduino Nano
- h-bridge l293d
- 12V or 5V DC RGB led strips (with resistances)
- 5V or 12 V DC power supply

Software:
https://vcis-gitlab.f4e.europa.eu/aneto/MARTe2 branch develop_armv8_linux
https://vcis-gitlab.f4e.europa.eu/aneto/MARTe2-components
https://mdsplus.org
arduino firmware, MARTe cfg , jscope file, mdsplus data tree , connection schematic and board, etc...https://github.com/LucBonc/tokaled

