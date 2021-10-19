%IIR notch filtering script

 function broadband_pass_IIR = IIR_notch_filter(record,channels,sig_length,Fs,t)
% notchSpecs = fdesign.notch('N,F0,BW,Ast',100,50,4,60,2048);
% notchFilt_50 = design(notchSpecs,'cheby2', 'SystemObject',true);
notch_50 = designfilt('bandstopiir', 'FilterOrder', 100, 'StopbandFrequency1', 49, 'StopbandFrequency2', 51, 'StopbandAttenuation', 60, 'SampleRate', Fs);
% notchSpecs = fdesign.notch('N,F0,BW,Ast',400,100,4,60,2048);
% notchFilt_100 = design(notchSpecs,'cheby2', 'SystemObject',true);
notch_100 = designfilt('bandstopiir', 'FilterOrder', 100, 'StopbandFrequency1', 99, 'StopbandFrequency2', 101, 'StopbandAttenuation', 60, 'SampleRate', Fs);
% notchSpecs = fdesign.notch('N,F0,BW,Ast',400,150,4,60,2048);
% notchFilt_150 = design(notchSpecs,'cheby2', 'SystemObject',true);
notch_150 = designfilt('bandstopiir', 'FilterOrder', 100, 'StopbandFrequency1', 149, 'StopbandFrequency2', 151, 'StopbandAttenuation', 60, 'SampleRate', Fs);
% notchSpecs = fdesign.notch('N,F0,BW,Ast',400,200,4,60,2048);
% notchFilt_200 = design(notchSpecs,'cheby2', 'SystemObject',true);
notch_200 = designfilt('bandstopiir', 'FilterOrder', 100, 'StopbandFrequency1', 199, 'StopbandFrequency2', 201, 'StopbandAttenuation', 60, 'SampleRate', Fs);
% notchSpecs = fdesign.notch('N,F0,BW,Ast',400,250,4,60,2048);
% notchFilt_250 = design(notchSpecs,'cheby2', 'SystemObject',true);
notch_250 = designfilt('bandstopiir', 'FilterOrder', 100, 'StopbandFrequency1', 249, 'StopbandFrequency2', 251, 'StopbandAttenuation', 60, 'SampleRate', Fs);
% notchSpecs = fdesign.notch('N,F0,BW,Ast',400,300,4,60,2048);
% notchFilt_300 = design(notchSpecs,'cheby2', 'SystemObject',true);


bandpass = designfilt('bandpassfir', 'FilterOrder', 800, 'StopbandFrequency1', 75, 'PassbandFrequency1', 80, 'PassbandFrequency2', 300, 'StopbandFrequency2', 305, 'SampleRate', Fs);
%fvtool(notchFilt_50,notchFilt_100,notchFilt_150)
disp('Filters built, filtering')
for n=47%1:channels %run signal through notch filters at 50Hz harmonics
    signal = record(n,:);
    %50Hz notch
    filt_50_sig = filter(notch_50,signal);  %filters each channel
    %delay =mean(grpdelay(notchFilt_50,sig_length,Fs));
    %100Hz notch
    filt_100_sig = filter(notch_100,filt_50_sig);
   % delay = delay + mean(grpdelay(notchFilt_100,sig_length,Fs));
    %150Hz notch
    filt_150_sig = filter(notch_150,filt_100_sig); 
   % delay = delay + mean(grpdelay(notchFilt_150,sig_length,Fs));
   filt_200_sig = filter(notch_200,filt_150_sig);
   %200Hz notch
   filt_250_sig = filter(notch_250,filt_200_sig); 
    %bandpass
    filt_sig_IIR = filter(bandpass,filt_250_sig);
   % delay = delay + mean(grpdelay(bandpass,sig_length,Fs));
% if n==47
%     figure
%     hold on
%     unfilt = signal;
%     filt= filt_sig;
%     
%     plot(t,unfilt)
%     plot(t,filt)
% end

disp("Channel " + n + " done")
 broadband_pass_IIR(n,:)= filt_sig_IIR; %put this back into zero matrix
end
   end




