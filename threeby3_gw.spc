# AERE 507X: Final course project
# Saveri Pal
# .spc file in gr1py
# Contains a 3 X 3 grid with two obstacles.
# |I|*| |
# | | | |
# | |*|G|
#

ENV: ;
# Defining grid scope: number of cells

SYS: Y_0_0 Y_0_1 Y_0_2 Y_1_0 Y_1_1 Y_1_2 Y_2_0 Y_2_1 Y_2_2;

ENVINIT: ;
ENVTRANS: ;
ENVGOAL: ;

# Initial position: Only one starting point

SYSINIT: (Y_0_0 & !Y_0_1 & !Y_0_2 & !Y_1_0 & !Y_1_1 & !Y_1_2 & !Y_2_0 & !Y_2_1 & !Y_2_2);

# Defining all possible movements from one cell

SYSTRANS: [](Y_0_0 -> (Y_0_0' | Y_1_0')) 
& [](Y_0_2 -> (Y_0_2' | Y_1_2'))
& [](Y_1_0 -> (Y_1_0' | Y_0_0' | Y_1_1' | Y_2_0'))
& [](Y_1_1 -> (Y_1_1' | Y_1_2' | Y_1_0'))
& [](Y_1_2 -> (Y_1_2' | Y_1_1' | Y_0_2' | Y_2_2'))
& [](Y_2_0 -> (Y_2_0' | Y_1_0'))
& [](Y_2_2 -> (Y_2_2'))

# Defining the blocked cells; the obstacles

& [](!(Y_0_1'))
& [](!(Y_2_1'))

# At any instant of time, the pointer can be at only one position

& []((Y_0_0' & (!Y_0_2') & (!Y_1_0') & (!Y_1_1') & (!Y_1_2') & (!Y_2_0') & (!Y_2_2'))
| (Y_0_2' & (!Y_0_0') & (!Y_1_0') & (!Y_1_1') & (!Y_1_2') & (!Y_2_0') & (!Y_2_2'))
| (Y_1_0' & (!Y_0_0') & (!Y_0_2') & (!Y_1_1') & (!Y_1_2') & (!Y_2_0') & (!Y_2_2'))
| (Y_1_1' & (!Y_0_0') & (!Y_0_2') & (!Y_1_0') & (!Y_1_2') & (!Y_2_0') & (!Y_2_2'))
| (Y_1_2' & (!Y_0_0') & (!Y_1_0') & (!Y_1_1') & (!Y_0_2') &  (!Y_2_0') & (!Y_2_2'))
| (Y_2_0' & (!Y_0_0') & (!Y_1_0') & (!Y_1_1') & (!Y_1_2') & (!Y_0_2') & (!Y_2_2'))
| (Y_2_2' & (!Y_0_0') & (!Y_1_0') & (!Y_1_1') & (!Y_1_2') & (!Y_2_0') & (!Y_0_2')));

# Defining the Goal position

SYSGOAL: []<>(Y_2_2);
