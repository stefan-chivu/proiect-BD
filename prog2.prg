set talk off
clear

use persoana.dbf
INDEX ON Cod_student TO icods

use fisa_note.dbf
INDEX ON Cod_student TO icodsf

use discipline.dbf
INDEX ON Cod_materie TO icodm

use persoana.dbf in 1 index icods alias per
use fisa_note.dbf in 2 index icodsf alias fisa
use discipline.dbf in 3 index icodm alias discip

select per
set relation to Cod_student into fisa

select fisa
set relation to Cod_materie into discip

select per

do while not(eof(1))
clear
contor = 0
suma_note = 0
nr_credite = 0
go 1 in 2

do while not(eof(2))

if per->Cod_student=fisa->Cod_student
suma_note = suma_note + fisa->Nota
contor = contor + 1

if fisa->Nota>=5
nr_credite = nr_credite + getCredite(fisa->Cod_materie)
endif

endif
skip 1 in 2

enddo

replace per->medie with suma_note/contor

if per->medie>=8.5 and nr_credite>=25
replace per->bursier with .T.
else
replace per->bursier with .F.
endif

skip 1 in 1
enddo
return