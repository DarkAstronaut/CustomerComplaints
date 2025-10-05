SELECT Company, COUNT(*) as Times
FROM `indigodemo.CreditDataset.CreditAll`
WHERE TimelyResponse = FALSE
AND SubmittedVia = "Phone"
GROUP BY Company
ORDER BY COUNT(*) DESC;