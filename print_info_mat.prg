function print_info_mat (value)

select FN
clear

set order to cod_materie
vcods = value
seek vcods

if eof()
         msgbox('Materia ' + vcods + ' nu a fost gasita!', 'Cod eronat', 0)

endif

do while FN->cod_materie = vcods
	?PERS->cod_student, PERS->Nume, PERS->Prenume, DIS->Denumire, FN->Nota, DIS->Profesor, DIS->Credite
	skip
enddo

return
