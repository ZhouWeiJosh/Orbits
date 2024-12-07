% Constants
R_E = 6731.8;        % Earth's radius in km
e = 1;               % Eccentricity

% Angle Range
theta = 0:1:360;
f = deg2rad(theta);

figure;

for altitude = 100:500:2000

    P = R_E + altitude;
    r = P ./ (1 + e * cos(f));

    polarplot(f, r, 'LineWidth', 2);
    hold on;

end

title('Parabolic Orbit')
rlim([0, 2 * P]);