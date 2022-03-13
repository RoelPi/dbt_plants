SELECT 
    c.contact_id,
    c.first_name,
    c.last_name,
    c.email_address,
    COUNT(DISTINCT o.email_id) as n_emails
FROM 
    b2b_data.opens o
    LEFT JOIN b2b_data.contacts c ON o.contact_id = c.contact_id
    LEFT JOIN b2b_data.emails e ON o.email_id = e.email_id
WHERE
    c.role = 'CIO'
GROUP BY
    1, 2, 3, 4
HAVING
    n_emails >= 3
