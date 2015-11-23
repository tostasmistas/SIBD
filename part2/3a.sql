SELECT r.snum, r.manuf, r.datetime, value, units
FROM Reading as r, Sensor as s, Wears as w, Connects as c, Device as d
WHERE description = 'blood pressure'
AND c.pan = w.pan
AND c.snum = d.serialnum
AND c.manuf = d.manufacturer
AND d.serialnum = s.snum
AND d.manufacturer = s.manuf
AND s.snum = r.snum
AND s.manuf = r.manuf
AND patient = '123456789'
AND r.datetime BETWEEN c.start AND c.end
AND r.datetime BETWEEN w.start AND w.end;
