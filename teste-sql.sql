SELECT serialnumber, device_name 
FROM devices 
WHERE os = 'macOS' and count_battery_cycles > 300

SELECT d.serialnumber, d.device_name 
FROM devices d
JOIN device_apps da
ON d.serialnumber = da.serialnumber 
and app_name <> 'Mosyle' 
or (app_name = 'Mosyle' and app_version <> '5.2.1')

SELECT da.app_name , count(d.serialnumber) 
FROM device_apps da
JOIN devices d
ON da.serialnumber <> da.serialnumber
GROUP BY da.app_name 

SELECT 
da.app_name , 
count((SELECT count(da.serialnumber)) / count(d.serialnumber) * 100 as porcentagem
FROM device_apps da
JOIN devices d
ON da.serialnumber = da.serialnumber
GROUP BY da.app_name 