set talk off
clear

use persoana.dbf
INDEX ON Cod_student TO icods

use fisa_note.dbf
//INDEX ON Cod_materie TO icodmf
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
do while .T.
clear
wait 'Incepeti d/n: ' to r

do case
case r='d'
c1='Cod student: '
c2='Cod'

case r='n'
close all
clear all
return

other 
?'Raspuns '+r+' invalid'
wait
loop
endcase

clear
ch=accept(c1)
seek trim(ch)
if eof()
? 'Studentul nu exista'
wait
loop
endif

do while Cod_student=ch
clear
?'Studentul: '+Nume+' '+Prenume
?'Cod student: '+str(Cod_student,10)
if eof(2)
?'Studentul nu are note'
else
do while not(eof(2))
if Cod_student=ch
? fisa->Nota
endif
skip 1 in 2
enddo
if eof(3)
?'Studentul nu este inscris la nici o materie'
else
? discip->Cod_materie,discip->Denumire
endif
endif
?
wait 'Continuati d/n: ' to r
skip
enddo
enddo
return