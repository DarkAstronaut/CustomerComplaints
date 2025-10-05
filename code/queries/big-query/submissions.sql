SELECT
	Product,
	SUM(CASE WHEN SubmittedVia = 'Web' THEN 1 ELSE 0 END) AS WebSubmission,
	SUM(CASE WHEN SubmittedVia = 'Phone' THEN 1 ELSE 0 END) AS PhoneCalls,
	SUM(CASE WHEN SubmittedVia = 'Referral' OR SubmittedVia = 'Web Referral' THEN 1 ELSE 0 END) AS Referrals
	SUM(CASE WHEN SubmittedVia = 'Post Mail' OR SubmittedVia = 'Email' OR SubmittedVia = 'Fax' THEN 1 ELSE 0 END) AS AllMails,
FROM `indigodemo.CreditDataset.CreditAll`
WHERE Product IS NOT NULL
GROUP BY Product;