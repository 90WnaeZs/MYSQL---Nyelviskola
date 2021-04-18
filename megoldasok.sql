A feladatok megoldására elkészített SQL parancsokat illessze be a feladat sorszáma után!


1. feladat:
CREATE DATABASE nyelviskola
 CHARACTER SET utf8mb4 COLLATE utf8mb4_hungarian_ci;

3. feladat:
ALTER TABLE vizsgak
ADD FOREIGN KEY (nyelvid) REFERENCES nyelvek(id);

ALTER TABLE jelentkezesek
ADD FOREIGN KEY (vizsga) REFERENCES vizsgak(sorsz);

4. feladat:
UPDATE `jelentkezesek` SET mobil=30784613 WHERE sorsz=9 AND nev="Dobos Zita";

5. feladat:
INSERT INTO `nyelvek`(`id`, `nyelv`) VALUES (8,'holland');

6. feladat:
SELECT MIN(2018-szulev) AS 'legfiatalabb',MAX(2018-szulev) AS 'legidősebb' FROM jelentkezesek;

7. feladat:
SELECT vizsgak.idopont
FROM vizsgak
JOIN jelentkezesek
ON vizsgak.sorsz=jelentkezesek.vizsga
GROUP BY vizsgak.idopont
HAVING COUNT(jelentkezesek.vizsga)>=25
ORDER BY vizsgak.idopont DESC;

8. feladat:
SELECT nyelvek.nyelv,vizsgak.szint,COUNT(jelentkezesek.sorsz) AS 'vizsgazo'
FROM nyelvek
JOIN vizsgak
ON nyelvek.id=vizsgak.nyelvid
JOIN jelentkezesek
ON vizsgak.sorsz=jelentkezesek.vizsga
GROUP BY vizsgak.nyelvid,vizsgak.szint