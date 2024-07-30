	
	
	
	
	DECLARE @json NVARCHAR(MAX);
	--| cria variavel para leitura
	SELECT @json = BulkColumn
	FROM OPENROWSET(
		BULK 'seu caminho', SINGLE_CLOB
	) AS jsonFile;

	--| Leitura do arquivo

	DROP TABLE IF EXISTS #OUTPUT_JSON
	SELECT
		JSON_VALUE(value, '$.ProductID') AS ProductID,
		JSON_VALUE(value, '$.ProductName') AS ProductName,
		JSON_VALUE(value, '$.Category') AS Category,
		JSON_VALUE(value, '$.Price') AS Price,
		JSON_VALUE(value, '$.StockQuantity') AS StockQuantity,
		JSON_VALUE(value, '$.Supplier') AS Supplier
	INTO #OUTPUT_JSON
	FROM OPENJSON(@json) AS Products;



