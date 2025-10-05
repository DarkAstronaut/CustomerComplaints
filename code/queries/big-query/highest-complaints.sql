SELECT Company, COUNT(DISTINCT(ComplaintID)) as 'Num of Complaints'
FROM `indigodemo.CreditDataset.CreditAll`
WHERE Product = 'Credit card'
GROUP BY Company
ORDER BY COUNT(*) DESC
LIMIT 10;