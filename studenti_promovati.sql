SELECT data_notare ,denumire,  COUNT(FIsa_note.cod_student) AS studenti_promovati , credite
FROM fIsa_note, discipline
WHERE Nota > 5 AND Fisa_note.cod_materie = Discipline.cod_materie
GROUP BY data_notare , denumire,  credite
ORDER BY credite DESC 






