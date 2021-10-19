% inputs pass_boundaries,stop_boundaries,number_filters
function [narrowband_filtered] = filtering(pass_boundaries,stop_boundaries,number_filters,Fs,broadband_pass,sig_length,channels)
% narrowband_filter = struct('filt80',[],'filt90',[],'filt100',[],'filt110',[],'filt120',[],'filt130',[],'filt140',[],'filt150',[],'filt160',[],'filt170',[],'filt180',[],'filt190',[],'filt200',[],'filt210',[],'filt220',[],'filt230',[],'filt240',[],'filt250',[],'filt260',[],'filt270',[],'filt280',[],'filt290',[],'filt300',[]); %unknkown size 
narrowband_filtered = struct('filter_name',{ 'filt80','filt90','filt100','filt110','filt120','filt130','filt140','filt150','filt160','filt170','filt180','filt190','filt200','filt210','filt220','filt230','filt240','filt250','filt260','filt270','filt280','filt290','filt300'});      
n=1;
% figure
% hold on
for n= 1: number_filters     %%loop creates filter 
    
    
    %add filtering limits here lower stop, lower pass, upper pass, upper
    %stop related to the filter itself
    lower_stop = stop_boundaries(n);
    lower_pass = pass_boundaries(n);
    upper_pass = pass_boundaries(n+1);
    upper_stop = stop_boundaries(n+2); 
    
    %change filter design here- have set order
    
             %y = designfilt('bandpassfir', 'StopbandFrequency1', lower_stop, 'PassbandFrequency1', lower_pass, 'PassbandFrequency2', upper_pass, 'StopbandFrequency2', upper_stop, 'StopbandAttenuation1', 60, 'PassbandRipple', 1, 'StopbandAttenuation2', 60);
            y= designfilt('bandpassfir', 'FilterOrder', 800, 'StopbandFrequency1', lower_stop, 'PassbandFrequency1', lower_pass, 'PassbandFrequency2', upper_pass, 'StopbandFrequency2', upper_stop, 'SampleRate', 2048);
        % %LS version
%         y = designfilt('bandpassfir', 'FilterOrder', 400, 'StopbandFrequency1', lower_stop, 'PassbandFrequency1', lower_pass, 'PassbandFrequency2', upper_pass, 'StopbandFrequency2', upper_stop, 'SampleRate', 2048, 'DesignMethod', 'ls');

            %y =  designfilt('bandpassfir', 'StopbandFrequency1', lower_stop, 'PassbandFrequency1', lower_pass, 'PassbandFrequency2', upper_pass, 'StopbandFrequency2', upper_stop, 'StopbandAttenuation1', 60, 'PassbandRipple', 0.1, 'StopbandAttenuation2', 60, 'SampleRate', 2000);
            filt_out = zeros(channels, sig_length);
                for m=47 %1:channels-1
                    sig = broadband_pass(m,:);
                    filt= filter(y,sig);
                    delay = mean(grpdelay(y));
                    filt_out(m,1:end)=filt(1:end);
                end
               % plot(filt_out(76,:))
            narrowband_filtered(n).filtered_data = filt_out;
            disp("Filter "  + n + " completed")
end
