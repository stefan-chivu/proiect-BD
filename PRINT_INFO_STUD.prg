function print_info_stud (x)

select FN
clear

set order to cod_student
vcods=x
seek vcods

if eof()
	msgbox('Studentul ' + vcods + ' nu a fost gasit!', 'Cod eronat', 0)
endif

do while FN->cod_student = vcods
	?PERS->cod_student, PERS->Nume, PERS->Prenume, DIS->Denumire, FN->Nota
	skip
enddo

return