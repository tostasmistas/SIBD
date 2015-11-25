SELECT DISTINCT muni
FROM Lives as l, Connects as c, Wears as w
WHERE c.manuf = 'Philips'
AND l.patient = w.patient
AND w.pan = c.pan
AND NOW() BETWEEN w.start AND w.end
AND NOW() BETWEEN c.start AND c.end
AND NOW() BETWEEN l.start AND l.end
GROUP BY muni
HAVING COUNT(snum)>= all (SELECT COUNT(snum)
                      FROM Lives as l1, Connects as c1, Wears as w1
                      WHERE c1.manuf = 'Philips'
                      AND l1.patient = w1.patient
                      AND w1.pan = c1.pan
                      AND NOW() BETWEEN w1.start AND w1.end
                      AND NOW() BETWEEN c1.start AND c1.end
                      AND NOW() BETWEEN l1.start AND l1.end
                      GROUP BY muni);
