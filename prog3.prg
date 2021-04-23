set talk off
clear

use fisa_note.dbf in 1 index icodsf alias fisa
use discipline.dbf in 2 index icodm alias discip

select fisa
set relation to Cod_materie into discip

select discip

k = 1

if(eof())
	? "Nu exista materii"
	return
endif

arrayTop = new array(1,2)

row_crt = 1
column_crt = 1
arrayTop.grow(2)

do while not(eof(2))
	note_sub = 0
	note_total = 0
	procent = 0.0
	i = 0
	denum_crt = discip->Cod_materie
	denum = discip->Denumire
	go 1 in 1
	do while not(eof(1))
		if fisa->Cod_materie == denum_crt
			if fisa->Nota < 5
				note_sub = note_sub + 1
			endif
			note_total = note_total + 1
			//? i + ' ' + discip->Cod_materie + ' ' + fisa->Nota
			i = i+1
		endif
		skip 1 in 1
	enddo
	
	if note_total>0
		procent = (note_sub/note_total) * 100
		//? denum_crt + procent + '%'
		//?
	else
		procent = -1
		//? denum_crt + procent + '%'
		//?
	endif
	
	
	nRow = arrayTop.subscript( arrayTop.size, 1)
	arrayTop[nRow,1] = procent
	arrayTop[nRow,2] = denum
	row_crt = row_crt+1
	arraytop.grow(1)
	
	k = k+1
	go k in 2
enddo

arrayTop = arrayTop.sort(1)

c = 1

do while c<=10
? arraytop[c,2] + ' | ' + arraytop[c,1] + '%'
c = c+1
enddo
/*? arraytop[2,2] + ' | ' + arraytop[2,1] + '%'
? arraytop[3,2] + ' | ' + arraytop[3,1] + '%'
? arraytop[4,2] + ' | ' + arraytop[4,1] + '%'
? arraytop[5,2] + ' | ' + arraytop[5,1] + '%'*/

return