function [fitresult, gof] = createFit5(time_section, sample)
%CREATEFIT5(TIME_SECTION,SAMPLE)
%  Create a fit.
%
%  Data for 'untitled fit 1' fit:
%      X Input : time_section
%      Y Output: sample
%  Output:
%      fitresult : a fit object representing the fit.
%      gof : structure with goodness-of fit info.
%
%  See also FIT, CFIT, SFIT.

%  Auto-generated by MATLAB on 16-Jul-2019 15:51:12


%% Fit: 'untitled fit 1'.
[xData, yData] = prepareCurveData( time_section, sample );

% Set up fittype and options.
ft = 'linearinterp';

% Fit model to data.
[fitresult, gof] = fit( xData, yData, ft, 'Normalize', 'on' );

% Create a figure for the plots.
figure( 'Name', 'untitled fit 1' );

% Plot fit with data.
subplot( 2, 1, 1 );
h = plot( fitresult, xData, yData );
legend( h, 'sample vs. time_section', 'untitled fit 1', 'Location', 'NorthEast' );
% Label axes
xlabel time_section
ylabel sample
grid on

% Plot residuals.
subplot( 2, 1, 2 );
h = plot( fitresult, xData, yData, 'residuals' );
legend( h, 'untitled fit 1 - residuals', 'Zero Line', 'Location', 'NorthEast' );
% Label axes
xlabel time_section
ylabel sample
grid on


