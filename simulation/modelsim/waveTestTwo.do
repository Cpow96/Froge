view wave 
wave clipboard store
wave create -driver freeze -pattern constant -value 000000111 -range 9 0 -starttime 0ns -endtime 1000ns sim:/map_ROM/currX 
WaveExpandAll -1
wave create -driver freeze -pattern constant -value 000000111 -range 9 0 -starttime 0ns -endtime 1000ns sim:/map_ROM/currY 
WaveExpandAll -1
WaveCollapseAll -1
wave clipboard restore
