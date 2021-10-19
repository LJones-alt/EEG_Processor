%identifies suspiscious areas from rms_struct_array based on background RMS
%levels

function [HFO]=identify_EOI(rms_struct_array, number_filters,channels,sig_length,rms_period,t)
EOI_sections = zeros(number_filters,sig_length);
HFO = [];
for n=1:number_filters
    %extract data for all channels through single filter
    narrowband_test_RMS= rms_struct_array(n).RMS; %RMS values
    narrowband_test_background = rms_struct_array(n).Moving_Background; %moving background values
    narrowband_test_SD= rms_struct_array(n).SD; %standard deviation values
    %these do have data
    
    %SD is bigger than RMS here??
    narrowband_positive= zeros(sig_length, channels);
    disp("Identifying components from filter " + n );
    for m=1:channels-1 %finds the positive values in single channel of filtered
        %extract single channel
     
        %disp("in channel " +m)
        channel_test_RMS = narrowband_test_RMS(:,m); %might need to be multiplied by 10^60
        channel_test_background= narrowband_test_background(:,m);
        channel_test_SD=narrowband_test_SD(:,m);
        channel_positive=zeros(1,sig_length);
        %make threshold value- will have to be a for loop :(
       
        for a=rms_period:rms_period:sig_length-rms_period
        %sets threshold value
            channel_rms=channel_test_RMS(a-(ceil(rms_period/2)):a+(ceil(rms_period/2)));
            background_rms=mean(channel_test_background(a-rms_period+1:a+rms_period));
            channel_SD = channel_test_SD(a-(ceil(rms_period/2)):a+(ceil(rms_period/2)));
            threshold= (channel_SD * 1.6) + background_rms; %this can be changed later
            %%you are here laura- making a variable threshold?? still not
            %%working
            
            %stil not working
            
            %window size too big???
          

            above_threshold= channel_rms> threshold;
            channel_positive(a-(ceil(rms_period/2)):a+(ceil(rms_period/2)))=above_threshold;
            %sort back into channel based array
        end 
        HFO(m).Data(n,:)=channel_positive;
        narrowband_positive(:,m)=channel_positive;

    end
    % this should produce a logic array of sig_length by channel for each
    % narrowbnd filter
    %go row-by-row (in time steps) identifying if there is a 1???
    
    eoi_potential_filter = zeros(1,sig_length);
    for m=1:sig_length %threshold need to be improved
        analyse_logic= narrowband_positive(m,:);
        if sum(analyse_logic) >= 1 
            eoi_potential = 1;
        else
            eoi_potential = 0;
        end
       
       eoi_potential_filter(m)=eoi_potential;
    end
    %this loop should have made a matrix of logic of number_filters rows
    %and sig_length columns
   EOI_sections(n,:)=eoi_potential_filter; 
   
   out = max(EOI_sections);
   pass = max(out);
  disp("Detection completed " + pass);  %still a detections issue- might be too big a window?? still giving a positive result for a lot of the time periods
end
%currently is picking up some areas

