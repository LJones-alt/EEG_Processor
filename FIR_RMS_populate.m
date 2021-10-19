%%RMS populate
% IIR_rms=zeros(22,rows);
% for n=1:number_filters
%     IIR_rms(n,:)=rms_struct_array(n).RMS(:,47);
% end
move_t=t(2401:end-2400);
filter=8;
FIR_rms_plot=FIR_rms(filter,4801:end);
figure(1)
subplot(3,1,1)
hold on
plot(t,non_filt_rms(filter,:))
title('Non-filtered signal')
subplot(3,1,2)
hold on
plot(move_t,FIR_rms_plot)
title('FIR filtered signals')
subplot(3,1,3)
hold on
plot(t,IIR_rms(filter,:))
title('IIR filtered signals')