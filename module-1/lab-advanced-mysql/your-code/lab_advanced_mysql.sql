USE lab_mysql_select;

/* ---------------------------------------------------------------------------------------------------
                                      Challenge 1
 ---------------------------------------------------------------------------------------------------*/
 
/* ------------------------------------- STEP 1 --------------------------------------------*/
 SELECT ta.au_id, ta.title_id, IFNULL(t.price*s.qty*t.royalty/100 *ta.royaltyper, 0 ) AS 'sales_royalty'
 FROM titleauthor AS ta
 LEFT JOIN titles AS t ON ta.title_id=t.title_id
 LEFT JOIN sales AS s ON ta.title_id = s.title_id
 ;
 
 /* ------------------------------------- STEP 2 --------------------------------------------*/
 SELECT au_id, title_id, SUM(sales_royalty) AS 'total_royalties' FROM
 ( SELECT ta.au_id, ta.title_id, IFNULL(t.price*s.qty*t.royalty/100 *ta.royaltyper, 0 ) AS 'sales_royalty'
 FROM titleauthor AS ta
 LEFT JOIN titles AS t ON ta.title_id=t.title_id
 LEFT JOIN sales AS s ON ta.title_id = s.title_id ) AS output1
 GROUP BY au_id, title_id
 ;
 
 /* ------------------------------------- STEP 3 --------------------------------------------*/
 SELECT output2.au_id, SUM(total_royalties + IFNULL(titles.advance, 0)) AS profits
 FROM 
 ( SELECT au_id, title_id, SUM(sales_royalty) AS 'total_royalties' FROM
 ( SELECT ta.au_id, ta.title_id, IFNULL(t.price*s.qty*t.royalty/100 *ta.royaltyper, 0 ) AS 'sales_royalty'
 FROM titleauthor AS ta
 LEFT JOIN titles AS t ON ta.title_id=t.title_id
 LEFT JOIN sales AS s ON ta.title_id = s.title_id ) AS output1
 GROUP BY au_id, title_id) AS output2
 LEFT JOIN titles ON output2.title_id = titles.title_id
 GROUP BY output2.au_id
 ORDER BY profits DESC
 LIMIT 3
 ;