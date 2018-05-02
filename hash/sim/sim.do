#set PathSeparator .

set WLFFilename waveform.wlf
set WildcardFileter {}
log -r tb_top/sha256/_W_Mem
log -r /*


#log -r /* 
run -all
quit
