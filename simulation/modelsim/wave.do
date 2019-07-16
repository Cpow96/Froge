view wave 
wave clipboard store
wave create -driver freeze -pattern constant -value 000000111 -range 9 0 -starttime 0ns -endtime 1000ns sim:/map_ROM/currX 
WaveExpandAll -1
wave create -driver freeze -pattern constant -value 000000111 -range 9 0 -starttime 0ns -endtime 1000ns sim:/map_ROM/currY 
WaveExpandAll -1
wave modify -driver freeze -pattern constant -value 0000001001 -range 9 0 -starttime 0ns -endtime 1000ns Edit:/map_ROM/currX 
wave edit change_value -start 0ns -end 100ns -value 000000111 Edit:/map_ROM/currX 
wave edit change_value -start 150ns -end 200ns -value 0000010001 Edit:/map_ROM/currX 
wave edit change_value -start 250ns -end 300ns -value 0000001001 Edit:/map_ROM/currY 
WaveCollapseAll -1
wave clipboard restore
