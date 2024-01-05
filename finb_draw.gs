*open file 
'reinit'
'open finb_0723.ctl'

*set location
'set lon 117.99 123.99'
'set lat 21.01 26.01'

********************

*figure setting
'set gxout shaded'
'set mpdset hires'

********************

*figure 1
'set parea 1 5. 1 7.5'
'set vpage 0 5.5 0 8.5'
'set cint 5'
'set xlevs 118 119 120 121 122 123'
'set ylevs 22 23 24 25 26'
'set grads off'

*draw Mean temperature
'd avg'
'draw title Mean of BT [K]'
"/home/teachers/fortran_ta/data/cbar.gs"

********************

*figure 2
'set parea 1 5. 1 7.5'
'set vpage  5.5 11 0 8.5'
'set xlevs 118 119 120 121 122 123'
'set ylevs 22 23 24 25 26'
'set grads off'

*draw STD
'd STD'
'draw title STD of BT [K]'
"/home/teachers/fortran_ta/data/cbar.gs"

********************

*save figure and close file
'printim finb.png'
'close 1'
