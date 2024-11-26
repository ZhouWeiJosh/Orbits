% Constants
R_E = 6731.8;       % Earth's radius in km
altitude = 300;
P = R_E + altitude;
e = 2;             % Eccentricity

% Angle Range
theta = 0:1:360;

figure;

for omega = 30:30:90
    f = deg2rad(theta - omega);
    r = P ./ (1 + e * cos(f));
    polarplot(f, r, 'LineWidth', 2);
    hold on;
end

title('Hyperbolic Orbit')
rlim([0, 3 * P]);