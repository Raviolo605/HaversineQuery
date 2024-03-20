
SELECT 
  HQID, 
  HQName, 
  HQAddress, 
  HQCAP, 
  HQLocation, 
  COALESCE(HQCoordinateLatitude, 0) AS HQCoordinateLatitude, 
  COALESCE(HQCoordinateLongitude, 0) AS HQCoordinateLongitude 
FROM 
  Headquarter 
WHERE 
  ACOS(
    SIN(
      PI() * " + x + " / 180
    ) * SIN(
      PI() * COALESCE(HQCoordinateLatitude, 0) / 180
    ) + " +
      COS(PI() * " + x + " / 180) * COS(PI() * COALESCE(HQCoordinateLatitude, 0) / 180) * " + COS(
      PI() * COALESCE(HQCoordinateLongitude, 0) / 180 - PI() * " + y + " / 180
    )
  ) * 6371 < " + radius + " 
UNION 
SELECT 
  DeptID, 
  DeptName, 
  DeptAddress, 
  DeptCAP, 
  DeptLocation, 
  COALESCE(DeptCoordinateLatitude, 0) AS DeptCoordinateLatitude, 
  COALESCE(DeptCoordinateLongitude, 0) AS DeptCoordinateLongitude 
FROM 
  Department 
WHERE 
  ACOS(
    SIN(
      PI() * " + x + " / 180
    ) * SIN(
      PI() * COALESCE(DeptCoordinateLatitude, 0) / 180
    ) + " +
      COS(PI() * " + x + " / 180) * COS(PI() * COALESCE(DeptCoordinateLatitude, 0) / 180) * " + COS(
      PI() * COALESCE(DeptCoordinateLongitude, 0) / 180 - PI() * " + y + " / 180
    )
  ) * 6371 < " + radius
