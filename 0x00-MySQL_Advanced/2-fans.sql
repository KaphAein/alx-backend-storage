-- creates a table metal fans
SELECT origin, SUM(fans) AS nb_fans
    FROM  metal_bands
    GROUP BY origin
    AND nb_fans DESC
;
