% Constants
R_E = 6731.8;        % Earth's radius in km
altitude = 300;
P = R_E + altitude;

% Angle Range
theta = 0:1:360;
f = deg2rad(theta);

figure;

for e = 0.1:0.1:0.9
    r = P ./ (1 + e * cos(f));
    polarplot(f, r, 'LineWidth', 2);
    hold on
end

title('Elliptical Orbit');