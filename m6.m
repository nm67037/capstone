% Define the range of x values
% We start slightly above 0 to avoid ln(0) which is -Inf
x = linspace(0.01, 100, 1000); 

% Calculate y values
% y = 36x / (ln(1.5x) - 1.37)
y = (36 .* x) ./ (log(1.5 .* x) - 1.37);

% Filter data to remove the asymptote and non-physical negative values
% For Paschen curves, we only care about the positive breakdown voltage
% This removes the vertical line artifact and the negative branch
valid_idx = y > 0;
x = x(valid_idx);
y = y(valid_idx);

% Find the minimum point
[min_y, idx] = min(y);
min_x = x(idx);

% Create the plot
figure;
plot(x, y, 'b-', 'LineWidth', 2);
grid on;
hold on; % Retain the graph to add markers

% Plot the minimum point
plot(min_x, min_y, 'r.', 'MarkerSize', 20);
text(min_x, min_y + 25, sprintf('Min: (%.2f, %.2f)', min_x, min_y), ...
    'VerticalAlignment', 'bottom', 'HorizontalAlignment', 'center', 'Color', 'red');

% Add labels and title
xlabel('Pd in mTorr*m');
ylabel('Breakdown Voltage in V');
title('Breakdown voltage vs pressure*distance of a capacitive plasma chamber design');

% Adjust the axis to see the curve better
ylim([200 800]); 
hold off;
