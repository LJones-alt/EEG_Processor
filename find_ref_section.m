% can a section of fairly clean signal be found? need to find a periodic
% section??

% flat_section = new_test_sig(28000:32000); %from inspection
% mod=mean(flat_section);
% ref=flat_section-mod;

% figure
% hold on
% plot(flat_section);
% plot(ref);

%frequency components?

n=100;
L=50; %work in sections of 50 data points
a=1;
order = 8;
test_signal = signal;
columns = ceil(length(test_signal) / L);
columns_2 = ceil(length(test_signal)/((2/3)*L));
rows = 1+L/2;
total_mag = zeros(order,5);
total_freq = zeros(order,5);
total_phase = zeros(order,5);

fit_array = zeros(length(test_signal),1);
error_array = zeros(length(test_signal),1);

%use stats to find section of signal with no artifacts?





% while n<  length(test_signal)  % takes a section and fits a polynomial to the data1
%     sample = test_signal((n-(L-1):n));
%     time_section = (t((n-(L-1):n)));
%     time_trans = time_section.';
%     createFit1(time_trans, sample);
%      %extract the fit function%    
%             [fitresult,gof] = fit(time_trans,sample,fittype('sin8'),fitoptions( 'Method', 'NonlinearLeastSquares'));
% %[fitresult, gof] = fit( time_section, sample,fittype('fourier8'), fitoptions('Method', 'NonlinearLeastSquares') );        
% %create function
% %     coefficients;
%     %refine the fit
% %     coeff = coeffvalues(fitresult);
% %     refine_fit(time_trans,sample);
% %             [fitresult,gof] = fit(time_trans,sample,fittype('sin8'),fitoptions( 'Method', 'NonlinearLeastSquares'));
%     coefficients;
%     fit_array((n-(L-1)):(n)) =sin_function(:);
%     error_array((n-(L-1)):(n)) = (sample - sin_function);
%     total_mag(:,a)=magnitude;
%     total_freq(:,a)=freq;
%     total_phase(:,a)=phase;
% 
% % fourrier_coefficients;
% % fit_array((n-(L-1)):(n)) =fourier_function(:);
%     n = n+(L);
%     a=a+1;
% end
% % 
% figure
% hold on
% plot(test_signal,'r')
% plot(fit_array,'b')
% plot(error_array,'k')
% hold off
