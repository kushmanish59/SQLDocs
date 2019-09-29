
DECLARE @Text NVARCHAR(MAX),@First  NVARCHAR(MAX),@Second  NVARCHAR(MAX),@Third  NVARCHAR(MAX),@Fourth NVARCHAR(MAX)
--SET @Text = 'Potential Donor - Eyes,MSK; Not Approached - Skin; Refusal - Cardiovascular; Medically unsuitable - Test1'
--SET @Text = 'Potential Donor - Eyes,MSK; Not Approached - Skin,MSK,TEST1; Medically unsuitable - Test1'
--SET @Text = 'Potential Donor - Eyes,MSK;'
SET @Text = 'Not Approached - Skin,MSK,TEST1; Refusal - Cardiovascular; Medically unsuitable - Test1'
SET @First = 'Not Approached - '
SET @Second = 'Potential Donor - '
SET @Third = 'Refusal -'
SET @Fourth = 'Medically unsuitable -'

IF(CHARINDEX(@First,@Text)>0)
BEGIN
	IF(CHARINDEX('Refusal',@Text)>0)
	BEGIN
		SELECT LTRIM(SUBSTRING(@Text, CHARINDEX(@First, @Text) + LEN(@First), 
                 CHARINDEX('; Refusal', @Text) - CHARINDEX(@First, @Text) - LEN(@First)))
	END	
	ELSE IF(CHARINDEX('Medically',@Text)>0)
	BEGIN 
		SELECT LTRIM(SUBSTRING(@Text, CHARINDEX(@First, @Text) + LEN(@First), 
                 CHARINDEX('; Medically', @Text) - CHARINDEX(@First, @Text) - LEN(@First)))
	END
END
IF(CHARINDEX(@Second,@Text)>0)
BEGIN
	IF(CHARINDEX(';',@Text)>0)
	BEGIN
		SELECT LTRIM(SUBSTRING(@Text, CHARINDEX(@Second, @Text) + LEN(@Second), 
                 CHARINDEX(';', @Text) - CHARINDEX(@Second, @Text) - LEN(@Second)))
	END	
	ELSE 
	BEGIN 
		SELECT LTRIM(SUBSTRING(@Text, CHARINDEX(@Second, @Text) + LEN(@Second), 
                 LEN(@Text) - CHARINDEX(@Second, @Text) - LEN(@Second)))
	END
END


IF(CHARINDEX(@Third,@Text)>0)
BEGIN
	IF(CHARINDEX('Medically',@Text)>0)
	BEGIN 
		SELECT LTRIM(SUBSTRING(@Text, CHARINDEX(@Third, @Text) + LEN(@Third), 
                 CHARINDEX('; Medically', @Text) - CHARINDEX(@Third, @Text) - LEN(@Third)))
	END
	ELSE
	BEGIN
		SELECT LTRIM(SUBSTRING(@Text, CHARINDEX(@Third, @Text) + LEN(@Third), 
                 LEN(@Text) - CHARINDEX(@Third, @Text) - LEN(@Third)))
	END
END

IF(CHARINDEX(@Fourth,@Text)>0)
BEGIN
		SELECT LTRIM(SUBSTRING(@Text, CHARINDEX(@Fourth, @Text) + LEN(@Fourth), 
                 LEN(@Text) - CHARINDEX(@Fourth, @Text) - LEN(@Fourth)))
END