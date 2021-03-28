set talk off
clear
use Persoana.dbf in 2
use Fisa_note.dbf in 2 alias fi
select 1
set relation to CNP into fi
use diagnostice.dbf in 3 alias di
select 2
set relation to Cod_diagnostic into di
select 1
do while .T.
clear
text
Programul afiseaza detaliile vizitelor unui pacient cu CNP dat
endtext
wait 'Incepeti d/n: ' to r
do case
case r='d'
set order to 1
c1='CNP pacient: '
c2='CNP'
case r='n'
close all
clear all
return other
?'Raspuns '+r+' invalid'
wait
loop
endcase
clear
ch=(c1)
seek trim(ch)
if eof()
msgbox('Pacientul precizat prin CNP-ul '+ch+' nu exista',1)
wait
loop
endif
do while &c2=ch
clear
?'Pacientul: '+Nume+' '+Prenume
?'CNP: '+CNP
if eof(2)
?'Pacientul nu are fisa medicala'
else
? fi->Data_consult
?'Data consultatiei: '+dtoc(fi->Data_consult)
if eof(3)
?'Pacientul nu are diagnostic'
else
+? di->Cod_diagnostic, di->denumire
?'Codul diagnosticului: '+di->Cod_diagnostic
?'Denumire diagnostic: '+di->denumire
endif
endif
?
wait 'Continuati:d/n' to r
skip





















