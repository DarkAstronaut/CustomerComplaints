SELECT
	Company,
	COUNT(ComplaintID) as ComplaintCount,
	SUM(CASE WHEN ConsumerDisputed = 'Yes' THEN 1 ELSE 0 END) as Disputed,
	SUM(CASE WHEN ConsumerDisputed = 'No' THEN 1 ELSE 0 END) as NotDisputed,
	SUM (CASE WHEN ConsumerDisputed = 'N/A' THEN 1 ELSE 0 END) as NotApplicable,
	CASE
		WHEN (SUM(CASE WHEN ConsumerDisputed = 'Yes' THEN 1 ELSE 0 END)) = 0 AND (SUM(CASE WHEN ConsumerDisputed = 'No' THEN 1 ELSE 0 END)) = 0
			THEN '0 %'
		ELSE
			CONCAT(ROUND((SUM(CASE WHEN ConsumerDisputed = 'Yes' THEN 1 ELSE 0 END)/(SUM(CASE WHEN ConsumerDisputed = 'No' THEN 1 ELSE 0 END)+SUM(CASE WHEN ConsumerDisputed = 'Yes' THEN 1 ELSE 0 END))*100),2),'%')
	END as DisputeRate
FROM `indigodemo.CreditDataset. CreditAll`
GROUP BY Company
ORDER BY ComplaintCount DESC;