SELECT cod_materie, COUNT(Fisa_note.Nota)  * 100.0 / (SELECT COUNT(Nota)
                                                        FROM Fisa_note
                                                        WHERE Fisa_note.Cod_materie = Discipline.Cod_materie 
                                                        ) AS Procentaj_studenti_picati
FROM Fisa_note
WHERE EXISTS (SELECT cod_materie
                  FROM Discipline
                    WHERE Fisa_note.Cod_materie = Discipline.Cod_materie AND Fisa_note.Nota < 5
                 )    GROUP BY cod_materie






           
