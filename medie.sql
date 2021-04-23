UPDATE Persoana
SET Medie = (SELECT AVG(Fisa_note.Nota) FROM Fisa_note WHERE Persoana.Cod_student = Fisa_note.Cod_student)
WHERE EXISTS (SELECT Cod_student FROM Fisa_note WHERE Persoana.Cod_student = Fisa_note.Cod_student);
 








