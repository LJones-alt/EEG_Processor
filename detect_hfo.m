% %find the sections of the time signal with HFO
lower_bound = 80;
upper_bound = 300;
lower_norm = lower_bound / Fs;
upper_norm = upper_bound / Fs;

lower_stop = lower_norm -0.005;
upper_stop = upper_norm + 0.05;
% fi
% 
% % 
broadband_pass = notch_filter(record,channels,sig_length,Fs);
%  broadband_pass_IIR = IIR_notch_filter(record,channels,sig_length,Fs,t);
disp('Notch filter complete, filtering by narrowband');
% % separate into narrow frequency bands of 10hz
narrow_width =10;
[pass_boundaries,stop_boundaries,number_filters] = narrowband_filters(lower_bound,upper_bound,narrow_width);
[narrowband_filtered] = filtering(pass_boundaries,stop_boundaries,number_filters,Fs,broadband_pass,sig_length,channels);
% [narrowband_filtered_IIR] = filtering(pass_boundaries,stop_boundaries,number_filters,Fs,broadband_pass_IIR,sig_length,channels);

% disp("Finished narrowband filtering, detecting RMS components");
% 
% 
% %find RMSof signal in each frequency band, centred at at each sample
% %duration

%  [rms_struct_array,rms_period] = rms(narrowband_filtered, channels, sig_length,number_filters,Fs);
%   [rms_struct_array_IIR,rms_period_IIR] = rms_IIR(narrowband_filtered, channels, sig_length,number_filters,Fs);

% this works contains specific RMS, background RMS and background SD
% disp("RMS calculation completed");

% [HFO]=identify_EOI(rms_struct_array, number_filters,channels,sig_length,rms_period,t);
% disp("EOI Dectection completed");

