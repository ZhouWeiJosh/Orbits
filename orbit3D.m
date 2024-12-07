% Define orbital parameters
a = 7000;          % Semi-major axis (km)
e = 0.1;           % Eccentricity
i = deg2rad(45);   % Inclination (radians)
omega = deg2rad(30); % Argument of perigee (radians)
RAAN = deg2rad(60);  % Longitude of ascending node (radians)

% Generate true anomaly range
nu = linspace(0, 2*pi, 500); % True anomaly (radians)

% Calculate radius
r = a * (1 - e^2) ./ (1 + e * cos(nu));

% Position in orbital plane
x_orb = r .* cos(nu);
y_orb = r .* sin(nu);
z_orb = zeros(size(x_orb)); % Orbital plane is initially 2D

% Rotation matrices
R_z_RAAN = [cos(RAAN) -sin(RAAN) 0; sin(RAAN) cos(RAAN) 0; 0 0 1];
R_x_inc = [1 0 0; 0 cos(i) -sin(i); 0 sin(i) cos(i)];
R_z_omega = [cos(omega) -sin(omega) 0; sin(omega) cos(omega) 0; 0 0 1];

% Combined rotation matrix
R = R_z_RAAN * R_x_inc * R_z_omega;

% Transform coordinates to ECI frame
orbital_coords = [x_orb; y_orb; z_orb];
eci_coords = R * orbital_coords;

% Extract ECI coordinates
x_eci = eci_coords(1, :);
y_eci = eci_coords(2, :);
z_eci = eci_coords(3, :);

% Plot in 3D
figure;
plot3(x_eci, y_eci, z_eci, 'b-', 'LineWidth', 1.5);
hold on;
plot3(0, 0, 0, 'ro', 'MarkerSize', 8, 'MarkerFaceColor', 'r'); % Central body
xlabel('X (km)');
ylabel('Y (km)');
zlabel('Z (km)');
grid on;
axis equal;
title('3D Orbital Plot');
