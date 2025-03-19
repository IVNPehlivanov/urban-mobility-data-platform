CREATE OR REPLACE FUNCTION haversine_km(lat1 numeric, lon1 numeric, lat2 numeric, lon2 numeric)
RETURNS numeric AS $$
DECLARE
    distance numeric;
BEGIN
    SELECT 6371 * ACOS(
        COS(radians(lat1))
        * COS(radians(lat2))
        * COS(radians(lon2) - radians(lon1))
        + SIN(radians(lat1)) * SIN(radians(lat2))
    ) INTO distance;
    RETURN distance;
END;
$$ LANGUAGE plpgsql IMMUTABLE;