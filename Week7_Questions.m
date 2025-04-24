clc
commandwindow
clear

a1 = 1938; % in Km
e1 = 0;
v2 = 1.5905; % in Km/s2
mi = 1224; % in Kg
mp = 157; % in Kg
Isp = 212; % in s
flight_path_angle_2 = -1.4784; % in degrees
g = 9.81 * 10^-3; % in m/s2


answer = log(1 - mp/mi)

delta_v = answer * Isp * g