SELECT 
	State,
	SUM(CASE WHEN Product = 'Credit card' THEN 1 ELSE 0 END) AS CreditCard,
	SUM(CASE WHEN Product = 'Credit reporting' THEN 1 ELSE 0 END) AS CreditReporting,
	SUM(CASE WHEN (Product != 'Credit card' OR Product != 'Credit reporting') THEN 1 ELSE 0 END) AS OtherProducts,
FROM `indigodemo.CreditDataset.CreditAll`
WHERE State IS NOT NULL
GROUP BY State;