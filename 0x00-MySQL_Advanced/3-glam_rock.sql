-- creates a table metal fans
SELECT band_name, (IFNULL(split, '2022') - formed) AS lifespan
    FROM  metal_bands
    WHERE FIND_IN_SET('Glam Rock', IFNULL(style, '')) > 0
    ORDER BY lifespan DESC;
