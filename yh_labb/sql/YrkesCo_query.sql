
-- Konsult, vilka kurser undervisas
SELECT
  p.namn || ' ' || p.efternamn AS konsult,
  k.timpris,
  kb.bolagsnamn,
  STRING_AGG(ku.kursnamn, ', ') AS kurser
FROM konsult k
JOIN personal p ON k.personal_id = p.personal_id
JOIN konsultbolag kb ON k.org_nummer = kb.org_nummer
JOIN kurspersonal kp ON p.personal_id = kp.personal_id
JOIN kurs ku ON kp.kurskod = ku.kurskod
GROUP BY p.namn, p.efternamn, k.timpris, kb.bolagsnamn;


-- Utbildningsledare, FÖRE
SELECT kl.klass_id, p.namn, p.efternamn, y.titel
FROM klass kl
inner join personal p on p.personal_id = kl.personal_id
inner join yrkesroll y on p.yrkes_id = y.yrkes_id
where y.yrkes_id = 1;

-- Utbildningsledare, EFTER
SELECT 
  p.namn || ' ' || p.efternamn AS utbildningsledare,
  STRING_AGG(kl.klass_id::text, ', ') AS klasser
FROM klass kl
INNER JOIN personal p ON p.personal_id = kl.personal_id
INNER JOIN yrkesroll y ON p.yrkes_id = y.yrkes_id
WHERE y.yrkes_id = 1
GROUP BY p.namn, p.efternamn;

-- Klass med kurser INNAN
SELECT kl.klass_id,pr.program_id ,k.kursnamn ,p.namn, p.efternamn, y.titel
FROM klass kl
inner join personal p on p.personal_id = kl.personal_id
inner join yrkesroll y on p.yrkes_id = y.yrkes_id
inner join beviljad b on kl.beviljad_id = b.beviljad_id
inner join program pr on b.program_id = pr.program_id
inner join kursprogram kp on pr.program_id = kp.program_id
inner join kurs k on kp.kurskod = k.kurskod
where y.yrkes_id = 1;

-- Klass med kurser EFTER

SELECT kl.klass_id, pr.program_id, STRING_AGG(k.kursnamn, ', ') AS kurser, p.namn, p.efternamn, y.titel
FROM klass kl
INNER JOIN personal p ON p.personal_id = kl.personal_id
INNER JOIN yrkesroll y ON p.yrkes_id = y.yrkes_id
INNER JOIN beviljad b ON kl.beviljad_id = b.beviljad_id
INNER JOIN program pr ON b.program_id = pr.program_id
INNER JOIN kursprogram kp ON pr.program_id = kp.program_id
INNER JOIN kurs k ON kp.kurskod = k.kurskod
WHERE y.yrkes_id = 1
GROUP BY kl.klass_id, pr.program_id, p.namn, p.efternamn, y.titel;


-- Ledningsgrupp per program INNAN
SELECT lg.program_id,sk.skolnamn ,p.namn as personal, y.titel, s.namn ||' '|| s.efternamn as student, f.namn, f.representant as företags_rep
FROM ledningsgrupp lg
inner join ledningspersonal lp on lg.ledningsgrupp_id = lp.ledningsgrupp_id
inner join personal p on lp.personal_id = p.personal_id
inner join ledningstudent ls on lg.ledningsgrupp_id = ls.ledningsgrupp_id
inner join student s on ls.student_id = s.student_id
inner join yrkesroll y on p.yrkes_id = y.yrkes_id
inner join ledningsfirma lf on lg.ledningsgrupp_id = lf.ledningsgrupp_id
inner join firma f on lf.org_nummer = f.org_nummer
inner join skola sk on lg.skol_id = sk.skol_id;

-- Ledningsgrupp per program EFTER
SELECT lg.program_id, sk.skolnamn, p.namn AS personal, y.titel, STRING_AGG(s.namn || ' ' || s.efternamn, ', ') AS studenter,
  f.namn AS företag, f.representant AS företags_rep
FROM ledningsgrupp lg
INNER JOIN ledningspersonal lp ON lg.ledningsgrupp_id = lp.ledningsgrupp_id
INNER JOIN personal p ON lp.personal_id = p.personal_id
INNER JOIN ledningstudent ls ON lg.ledningsgrupp_id = ls.ledningsgrupp_id
INNER JOIN student s ON ls.student_id = s.student_id
INNER JOIN yrkesroll y ON p.yrkes_id = y.yrkes_id
INNER JOIN ledningsfirma lf ON lg.ledningsgrupp_id = lf.ledningsgrupp_id
INNER JOIN firma f ON lf.org_nummer = f.org_nummer
INNER JOIN skola sk ON lg.skol_id = sk.skol_id
GROUP BY lg.program_id, sk.skolnamn, p.namn, y.titel, f.namn, f.representant;


-- Ledningsgrupp med studenter och företag
SELECT lg.program_id,sk.skolnamn ,p.namn as personal, y.titel,
s.namn as student, b.program_id || b.anno as klass, f.namn, f.representant as företags_rep
FROM ledningsgrupp lg
inner join ledningspersonal lp on lg.ledningsgrupp_id = lp.ledningsgrupp_id
inner join personal p on lp.personal_id = p.personal_id
inner join ledningstudent ls on lg.ledningsgrupp_id = ls.ledningsgrupp_id
inner join student s on ls.student_id = s.student_id
inner join antagen_student ast on s.student_id = ast.student_id 
inner join yrkesroll y on p.yrkes_id = y.yrkes_id
inner join ledningsfirma lf on lg.ledningsgrupp_id = lf.ledningsgrupp_id
inner join firma f on lf.org_nummer = f.org_nummer
inner join skola sk on lg.skol_id = sk.skol_id
inner join klass kl on ast.klass_id = kl.klass_id 
inner join beviljad b on kl.beviljad_id = b.beviljad_id;

-- 1. Lista alla studenter med kontaktinfo och vilken skola de tillhör
SELECT 
  s.student_id,
  s.namn AS förnamn,
  s.efternamn,
  s.epost,
  s.telefon,
  sk.skolnamn
FROM student s
JOIN skola sk ON s.skol_id = sk.skol_id;


-- ‍2. Alla utbildare – både fasta och konsulter – med ev. timarvode

SELECT 
  p.personal_id,
  p.namn,
  p.efternamn,
  yr.titel,
  CASE 
    WHEN k.personal_id IS NOT NULL THEN 'Konsult'
    ELSE 'Fast anställd'
  END AS anställningsform,
  k.timpris
FROM personal p
JOIN yrkesroll yr ON p.yrkes_id = yr.yrkes_id
LEFT JOIN konsult k ON p.personal_id = k.personal_id;



-- Programöversikt: kurser och skolor

SELECT 
  pr.programnamn,
  k.kursnamn,
  sk.skolnamn
FROM program pr
JOIN kursprogram kp ON pr.program_id = kp.program_id
JOIN kurs k ON kp.kurskod = k.kurskod
JOIN skolprogram sp ON sp.program_id = pr.program_id
JOIN skola sk ON sp.skol_id = sk.skol_id;

-- Kursöversikt med betyg
SELECT 
  k.kursnamn,
  s.namn,
  s.efternamn,
  kb.betyg
FROM kursbetyg kb
JOIN kurs k ON kb.kurskod = k.kurskod
JOIN student s ON kb.student_id = s.student_id;

-- Fristående kurser samt dess utbildare
SELECT 
  fk.fk_id,
  k.kursnamn,
  p.namn AS utbildare_förnamn,
  p.efternamn AS utbildare_efternamn,
  sk.skolnamn
FROM fri_kurs fk
JOIN kurs k ON fk.kurskod = k.kurskod
JOIN personal p ON fk.personal_id = p.personal_id
JOIN skola sk ON fk.skol_id = sk.skol_id;

-- Ledningsgrupp – deltagare och tillhörande program
SELECT 
  lg.ledningsgrupp_id,
  pr.programnamn,
  sk.skolnamn,
  p.namn AS personal_förnamn,
  p.efternamn AS personal_efternamn
FROM ledningsgrupp lg
JOIN program pr ON lg.program_id = pr.program_id
JOIN skola sk ON lg.skol_id = sk.skol_id
LEFT JOIN ledningspersonal lp ON lg.ledningsgrupp_id = lp.ledningsgrupp_id
LEFT JOIN personal p ON lp.personal_id = p.personal_id;

-- Antal program i varje stad (Göteborg och Stockholm)
SELECT 
  st.stad,
  COUNT(DISTINCT sp.program_id) AS antal_program
FROM skolprogram sp
JOIN skola sk ON sp.skol_id = sk.skol_id
JOIN adress a ON sk.adress_id = a.adress_id
JOIN stad st ON a.stad_id = st.stad_id
GROUP BY st.stad;


--  Konsultbolag med kontaktuppgifter och F-skatt
SELECT 
  k.org_nummer,
  k.bolagsnamn,
  a.gatuadress,
  a.postnummer,
  st.stad,
  k.f_skatt
FROM konsultbolag k
JOIN adress a ON k.adress_id = a.adress_id
JOIN stad st ON a.stad_id = st.stad_id;

-- Alla skolor och deras adress + stad
SELECT 
  sk.skolnamn,
  a.gatuadress,
  a.postnummer,
  st.stad
FROM skola sk
JOIN adress a ON sk.adress_id = a.adress_id
JOIN stad st ON a.stad_id = st.stad_id;


-- Lista alla fasta utbildare och vilka kurser de undervisar
SELECT 
  p.personal_id,
  p.namn,
  p.efternamn,
  k.kursnamn,
  k.kurskod
FROM personal p
JOIN fast_arbete fa ON p.personal_id = fa.personal_id
JOIN kurspersonal kp ON p.personal_id = kp.personal_id
JOIN kurs k ON kp.kurskod = k.kurskod;

SELECT DISTINCT 
  s.student_id,
  s.namn,
  s.efternamn
FROM student s
JOIN antagen_student ast ON s.student_id = ast.student_id
JOIN ledningstudent ls ON s.student_id = ls.student_id;