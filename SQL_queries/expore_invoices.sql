
--- MIn. amount of invoices
SELECT MIN(i.Total) as min
FROM invoices i;

--- MIn. amount of invoices
SELECT MAX(i.Total) as max
FROM invoices i;


--- Distribution of amount of invoices
SELECT i.Total 
FROM invoices i
limit 10;

-- Users pays the most
SELECT c.Country, SUM(i.Total) as total_amount, 
		COUNT(*) AS invoices_number, AVG(i.Total) avg_amount
FROM invoices i 
	JOIN customers c on c.CustomerId = i.CustomerId 
GROUP BY c.CustomerId
ORDER BY total_amount DESC;
ORDER BY avg_amount DESC ;





-- invoice item distribution by quantity
SELECT t1.Quantity, COUNT(*) as number
FROM invoice_items t1
GROUP BY t1.Quantity ;



-- Not consistent total
SELECT i.Total, SUM(ii.UnitPrice) as sum_items
FROM invoices i 
	JOIN invoice_items ii ON ii.InvoiceId = i.InvoiceId 
GROUP BY i.InvoiceId 
HAVING i.Total != SUM(ii.UnitPrice);
	

SELECT i.Total, ROUND((SUM(ii.UnitPrice)), 2) sum_items
FROM invoices i 
	JOIN invoice_items ii ON ii.InvoiceId = i.InvoiceId 
GROUP BY i.InvoiceId 
HAVING i.Total != ROUND((SUM(ii.UnitPrice)), 2);
