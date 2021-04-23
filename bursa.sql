UPDATE Persoana
SET Bursier = TRUE
WHERE Medie >= 8.5
AND NOT EXISTS(SELECT Nota 
					FROM Fisa_note 
               WHERE Nota < 5 AND Persoana.cod_student = Fisa_note.cod_student)

AND EXISTS(SELECT Persoana.Cod_student, SUM(Credite) 
	  FROM Discipline d, Persoana p  
	  GROUP BY p.cod_student HAVING SUM(Credite) >= 25) 
                                      ;
