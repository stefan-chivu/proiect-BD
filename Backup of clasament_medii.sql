SELECT Cod_student, Medie, Nume, Prenume 
FROM Persoana

GROUP BY   Cod_student, Nume, Prenume, Medie
ORDER BY Medie DESC
