function [lon, lat] = cart2lonlat(x, y, lon_ref, lat_ref)
% lats_rad : vecteur des latitudes en radian
% lons_rad : vecteur des longitudes en radian
R = 6371;

lat_ref_rad = deg2rad(lat_ref);
lon_ref_rad = deg2rad(lon_ref);

lon_rad = x/(R*cos(lat_ref_rad)) + lon_ref_rad;
lat_rad = y/R + lat_ref_rad;

lon = rad2deg(lon_rad);
lat = rad2deg(lat_rad);