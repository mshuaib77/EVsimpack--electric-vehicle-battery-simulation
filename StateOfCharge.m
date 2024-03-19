Calculating the State of Charge of the Battery
% Given parameters
q = 50; % Assumed current charge in Ahr
battery_capacity_Ahr = 100; % Total battery capacity in Ahr
time_conversion_factor = 3600; % Conversion factor from hours to seconds

% Gain factor for SoC calculation
gain_factor = 1 / (battery_capacity_Ahr * time_conversion_factor);

% Calculate State of Charge (SoC) as a percentage
SoC = q * gain_factor * 100; % SoC in percentage

% Display the State of Charge
disp(['The State of Charge (SoC) is ', num2str(SoC), '%']);
Calculating the depth of charge ot the battery 
Calculating how long it takes the battery to reach 40% depth of charge
% Define the time intervals (in seconds) and current values (in amperes)
time_intervals = [0, 19, 38, 42, 47, 72];
current_values = [0, 100, 35, 35, 0, 0];

% Calculate the area under the current-time graph for one cycle to find the charge in Ah
% This is done by breaking the graph into trapezoids and rectangles and summing their areas
charge_per_cycle = 0; % initialize charge per cycle
for i=1:(length(time_intervals)-1)
    dt = time_intervals(i+1) - time_intervals(i);
    avg_current = (current_values(i) + current_values(i+1)) / 2;
    charge_per_cycle = charge_per_cycle + avg_current * dt;
end
charge_per_cycle = charge_per_cycle / 3600; % convert charge from A-s (Coulombs) to A-h

% Assume the battery capacity is 100 Ah
battery_capacity = 100; % in Ah

% Depth of Discharge (DoD) we want to calculate the time for
target_dod = 0.4;

% Calculate the total charge needed to reach 40% DoD
total_charge_needed = battery_capacity * target_dod; % in Ah

% Calculate how many cycles are needed to reach 40% DoD
cycles_needed = total_charge_needed / charge_per_cycle;

% Each cycle is 72 seconds, so total time in seconds to reach 40% DoD is
time_to_reach_40pct_dod = cycles_needed * 72;

% Display the result
disp(['Time to reach 40% DoD: ', num2str(time_to_reach_40pct_dod), ' seconds']);

