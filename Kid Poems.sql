
-- Question 1
SELECT * FROM Grade;

-- Question 2
SELECT * FROM Emotion;

-- Question 3
SELECT COUNT(id)as 'PoemCount' FROM Poem ;

-- Question 4, 5, 6
SELECT TOP 76 a.Name,
g.Name,
ge.Name
FROM Author a 
JOIN Grade g on a.GradeId = g.Id 
JOIN Gender ge on a.GenderId = ge.Id
ORDER BY a.Name;

-- Question 7
SELECT SUM(WordCount) as 'WordCount' FROM Poem;

-- Question 8
SELECT Min(CharCount) as 'MinCharacterCount' FROM Poem;

-- Question 9
SELECT Count(a.Name) as '3rd Grade authors'


FROM Author a 
Join Grade g on a.GradeId = g.id
WHERE g.Name = '3rd Grade';

-- Question 10
SELECT Count(a.Name) as '1st, 2nd, 3rd Grade authors'


FROM Author a 
Join Grade g on a.GradeId = g.id
WHERE g.Name = '3rd Grade' Or g.Name = '2nd Grade' Or g.Name = '1st Grade' ; 

-- Question 11
SELECT Count(p.Title) as '4th Grade Poems'

FROM Poem p
Join Author a on p.AuthorId = a.id
JOIN Grade g on a.GradeId = g.id
WHERE g.Name = '4th Grade';

-- Question 12
SELECT Count(p.Title) as 'Poems per Grade',
g.Name

FROM Poem p
Join Author a on p.AuthorId = a.id
JOIN Grade g on a.GradeId = g.id
GROUP BY g.Name;

-- Question 13
SELECT Count(a.Name) as 'Authors per Grade',
g.Name

FROM Author a

JOIN Grade g on a.GradeId = g.id
GROUP BY g.Name;


-- Question 14
SELECT p.Title,
p.WordCount

FROM Poem p
WHERE WordCount = (SELECT MAX(WordCount) AS 'MaxWordCount'
		FROM Poem );



-- Question 17
Select Top 1 a.Name,
Count(p.AuthorId) as 'AuthorCount'
From Author a 
Join Poem p on p.AuthorId = a.id
GROUP BY a.Name
ORDER BY AuthorCount desc;




-- Question 16
SELECT Count(e.Name)

FROM Emotion e 
Join PoemEmotion pe on pe.EmotionId = e.id
Join Poem p on pe.PoemId = p.Id
WHERE e.Name = 'Sadness';



-- Question 19
SELECT Count(p.Title)

FROM Poem p
Left Join PoemEmotion pe on pe.PoemId = p.Id
WHERE pe.PoemId IS NULL;

SELECT Top 1 e.Name,
COUNT(e.Name)

FROM Emotion e 
Join PoemEmotion pe on pe.EmotionId = e.id
Join Poem p on pe.PoemId = p.Id
Group by e.Name;

-- Question 19
SELECT  Top 1 g.Name,
Count(e.name) as 'EmotionCOunt'
FROM Author a 
Join Grade g on a.GradeId = g.id
Join Poem p on p.AuthorId = a.id
Join PoemEmotion ep on ep.PoemId = p.Id
Join Emotion e on ep.EmotionId = e.id
Where e.name = 'Joy'
GROUP BY g.Name
ORDER BY EmotionCount desc;

-- Question 20
SELECT  Top 1 ge.Name,
Count(ge.name) as 'GenderCount'
FROM Author a 
Join Gender ge on a.GenderId = ge.Id
Join Poem p on p.AuthorId = a.id
Join PoemEmotion ep on ep.PoemId = p.Id
Join Emotion e on ep.EmotionId = e.id
Where e.name = 'Fear'
GROUP BY ge.Name
ORDER BY GenderCount;






