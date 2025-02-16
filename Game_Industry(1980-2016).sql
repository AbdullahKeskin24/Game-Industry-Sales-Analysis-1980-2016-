/****** Script for SelectTopNRows command from SSMS  ******/
DELETE FROM vgsales
WHERE [Year] = '2017','2018','2019','2020','2021','2022','2023' ;

--TR
  -- 2017 ve sonras� veri yetersizli�inden silindi. 
  --N/A a sahip publisherlar, oyun t�rleri ve oyun platformlar� silindi (excel'den yap�ld�)

 --EN
 -- 2017 and later were deleted due to insufficient data. 
 -- N/A publishers, game genres and game platforms were deleted (done from excel)
