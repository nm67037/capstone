% Define the range of x values
% We start slightly above 0 to avoid ln(0) which is -Inf
x = linspace(0.01, 100, 1000); 

% Calculate y values
% We use the dot operator (.) for element-wise operations
% y = 36x / (ln(1.5x) - 1.37)
% Note: In MATLAB, log() represents the natural logarithm (ln)
y = (36 .* x) ./ (log(1.5 .* x) - 1.37);

% Create the plot
figure;
plot(x, y, 'b-', 'LineWidth', 2);
grid on;

% Add labels and title
xlabel('x (Independent Variable)');
ylabel('y (Dependent Variable)');
title('Plot of y = 36x / (ln(1.5x) - 1.37)');

% Adjust the axis to see the curve better if there are asymptotes
% limiting y-axis helps if there's a vertical asymptote causing spikes
ylim([-500 500]); 

% Optional: Add a line for the vertical asymptote if it exists in range
% The denominator is zero when ln(1.5x) = 1.37
% 1.5x = exp(1.37) -> x = exp(1.37)/1.5
asymptote_x = exp(1.37) / 1.5;
if asymptote_x <= 100 && asymptote_x >= 0
    xline(asymptote_x, '--r', 'Vertical Asymptote');
end