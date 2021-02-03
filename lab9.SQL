/*CREATE TABLE lab9_station(
    eio_netcode VARCHAR(10) NOT NULL PRIMARY KEY, 
    station VARCHAR(40), 
    status VARCHAR(20)
);

CREATE TABLE lab9_pollutant(
    eea_pol INTEGER PRIMARY KEY, 
    pollutant VARCHAR(50), 
    notation VARCHAR(10)
);

CREATE TABLE lab9_monitors(
    station VARCHAR(10) NOT NULL 
        REFERENCES lab9_station (eio_netcode)
        ON UPDATE cascade 
        ON DELETE cascade,
    eea_pol INTEGER NOT NULL 
        REFERENCES lab9_pollutant (eea_pol)
        ON UPDATE cascade ON DELETE cascade
);
*/

DELETE FROM lab9_monitors;
DELETE FROM lab9_station;
DELETE FROM lab9_pollutant;

INSERT INTO lab9_station values('IE0145A', 'Mayo Claremorris',       'Rural-Remote');
INSERT INTO lab9_station values('IE0028A', 'Dublin Rathmines',       'Urban');
INSERT INTO lab9_station values('IE0125A', 'Galway City',            'Suburban');
INSERT INTO lab9_station values('IE0111A', 'Laois Emo Court',        'Rural-regional');
INSERT INTO lab9_station values('IE0090A', 'Monaghan Kilkitt',       'Rural-regional');
INSERT INTO lab9_station values('IE0147A', 'Kilkenny Seville Lodge', 'Suburban');

INSERT INTO lab9_pollutant values(1,    'Sulphur dioxide (air)',             'SO2');
INSERT INTO lab9_pollutant values(10,   'Carbon monoxide (air)',             'CO');
INSERT INTO lab9_pollutant values(7,    'Ozone (air)',                       'O3');
INSERT INTO lab9_pollutant values(8,    'Nitrogen dioxide (air)',            'NO2');
INSERT INTO lab9_pollutant values(5,    'Particulate matter < 10 (aersol)',  'PM10');
INSERT INTO lab9_pollutant values(6001, 'Particulate matter < 2.5 (aersol)', 'PM2.5');

INSERT INTO lab9_monitors values('IE0028A', 1);
INSERT INTO lab9_monitors values('IE0028A', 10);
INSERT INTO lab9_monitors values('IE0028A', 7);
INSERT INTO lab9_monitors values('IE0028A', 8);
INSERT INTO lab9_monitors values('IE0028A', 5);
INSERT INTO lab9_monitors values('IE0028A', 6001); -- |
INSERT INTO lab9_monitors values('IE0145A', 7);
INSERT INTO lab9_monitors values('IE0145A', 8);
INSERT INTO lab9_monitors values('IE0145A', 5);
INSERT INTO lab9_monitors values('IE0145A', 6001);
INSERT INTO lab9_monitors values('IE0111A', 7);
INSERT INTO lab9_monitors values('IE0111A', 8);
INSERT INTO lab9_monitors values('IE0111A', 5);
INSERT INTO lab9_monitors values('IE0111A', 6001);
INSERT INTO lab9_monitors values('IE0090A', 7);
INSERT INTO lab9_monitors values('IE0090A', 8);
INSERT INTO lab9_monitors values('IE0090A', 5);
INSERT INTO lab9_monitors values('IE0090A', 6001); -- |
INSERT INTO lab9_monitors values('IE0125A', 1);
INSERT INTO lab9_monitors values('IE0125A', 8);
INSERT INTO lab9_monitors values('IE0125A', 5);
INSERT INTO lab9_monitors values('IE0125A', 6001);
INSERT INTO lab9_monitors values('IE0147A', 1);
INSERT INTO lab9_monitors values('IE0147A', 8);
INSERT INTO lab9_monitors values('IE0147A', 5);
INSERT INTO lab9_monitors values('IE0147A', 6001);






SELECT lab9_station.eio_netcode,lab9_station.station,lab9_station.status,lab9_pollutant.eea_pol,lab9_pollutant.pollutant
FROM lab9_station,lab9_monitors,lab9_pollutant
where (lab9_station.station = lab9_monitors.station) and (lab9_pollutant.eea_pol = lab9_monitors.eea_pol) and (lab9_pollutant.eea_pol IN (6001,5));















