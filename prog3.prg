set talk off
clear

use persoana.dbf
INDEX ON Cod_student TO icods

use fisa_note.dbf
INDEX ON Cod_student TO icodsf

use discipline.dbf
INDEX ON Cod_materie TO icodm

use fisa_note.dbf in 1 index icodsf alias fisa
use discipline.dbf in 2 index icodm alias discip

select fisa
set relation to Cod_materie into discip

select discip

cea_mai_rea = ""
denumire_rea = ""
proc_final = 0

do while not(eof(2))
clear
stud_pic_crt = 0
stud_tot = 0
procent = 0

do while not(eof(1))

if fisa->Cod_materie=discip->Cod_materie and fisa->Nota<5
stud_pic_crt = stud_pic_crt + 1
endif

stud_tot = stud_tot +1

skip 1 in 1

enddo

procent = (stud_pic_crt/stud_tot)*100

if procent>proc_final

proc_final = procent
cea_mai_rea = discip->Cod_materie
denumire_rea = discip->Denumire

endif

skip 1 in 2

enddo

clear
?'Materie: '+cea_mai_rea+' '+ denumire_rea + ' | ' + procent + '% picati'

return