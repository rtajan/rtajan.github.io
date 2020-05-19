function p = lonlat2cart(lons, lats, lon_ref, lat_ref)
% lats_rad : vecteur des latitudes en radian
% lons_rad : vecteur des longitudes en radian

lons_rad = deg2rad(lons);
lats_rad = deg2rad(lats);

lat_ref_rad = deg2rad(lat_ref);
lon_ref_rad = deg2rad(lon_ref);

len   = length(lons_rad);

R = 6371;

x = R*(lons_rad-lon_ref_rad).*cos(lat_ref_rad);
y = R*(lats_rad-lat_ref_rad);
p = [x(:), y(:)];