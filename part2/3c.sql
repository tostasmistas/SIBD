SELECT distinct manufacturer
FROM Device as d
WHERE description = 'scale'
AND NOT EXISTS (SELECT nut4code
                FROM Municipality
                WHERE nut4code NOT IN(SELECT muni
                                      FROM Lives as l, Wears as w, Connects as c, Device as d1
                                      WHERE l.patient = w.patient
                                      AND w.pan = c.pan
                                      AND c.manuf = d1.manufacturer
                                      AND c.snum = d1.serialnum
                                      AND TIMESTAMPDIFF(YEAR,l.end, NOW()) < 1
                                      AND TIMESTAMPDIFF(YEAR,w.end, NOW()) < 1
                                      AND TIMESTAMPDIFF(YEAR,c.end, NOW()) < 1
                                      AND TIMESTAMPDIFF(SECOND,c.end, l.start) >= 0
                                      AND TIMESTAMPDIFF(SECOND,l.end, c.start) >= 0
                                      AND TIMESTAMPDIFF(SECOND,l.end, w.start) >= 0
                                      AND TIMESTAMPDIFF(SECOND,w.end, l.start) >= 0
                                      AND TIMESTAMPDIFF(SECOND,w.end, c.start) >= 0
                                      AND TIMESTAMPDIFF(SECOND,c.end, w.start) >= 0
                                      AND d.manufacturer = d1.manufacturer));
