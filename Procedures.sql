-- Procedure to Insert Property
CREATE OR REPLACE PROCEDURE insertproperty (
    floors IN NUMBER,
    owner_id IN NUMBER,
    property_id IN NUMBER,
    hike IN NUMBER,
    year_of_construction IN NUMBER,
    start_date IN DATE,
    end_date IN DATE,
    total_area IN NUMBER,
    plinth_area IN NUMBER,
    rent_per_month IN NUMBER,
    locality IN VARCHAR,
    rooms IN NUMBER,
    address IN VARCHAR
) AS
BEGIN
    INSERT INTO property 
    VALUES (floors, owner_id, property_id, hike, year_of_construction, start_date, end_date, total_area, plinth_area, rent_per_month, locality, rooms, address);
END;
/

-- Procedure to Get Tenant Details
CREATE OR REPLACE PROCEDURE GetTenantDetails(propertyw IN NUMBER) AS
BEGIN
  FOR tenant IN (SELECT u.* FROM users u JOIN rental t ON u.adharid = t.tenant_id WHERE t.property_id = propertyw)
  LOOP
    DBMS_OUTPUT.PUT_LINE('Tenant ID: ' || tenant.adharid);
    DBMS_OUTPUT.PUT_LINE('Name: ' || tenant.name);
    DBMS_OUTPUT.PUT_LINE('Email: ' || tenant.email);
    DBMS_OUTPUT.PUT_LINE('Phone: ' || tenant.phone);
    DBMS_OUTPUT.PUT_LINE('Address: ' || tenant.address);
    DBMS_OUTPUT.PUT_LINE('---');
  END LOOP;
END;
/
