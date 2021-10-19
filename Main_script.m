% Main Script
% 
%edfread2; % runs program to import and read the EDF data, hdr gives overall info on the imported data
% 

[hdr, record] = edfread2('new_signal.edf'); % creates matrix of data points
disp("Signal loaded")
[rows,columns] = size(record);
%check to make sure each channel is own row, if not, switch them
if rows> columns
    record = record.';
    disp("Transposing channels and time-series data");
end


[channels, sig_length] = size(record);


%enter limits of frequency
% lower_bound = input('Enter minimum frequency of interest:  ');
% upper_bound = input('Enter upper frequency limit:   ');

% check limits



% noise = record(:,20); %this should actualy look for a signal that is just the line noise but TBC

Fs = input('Enter sampling frequency in Hz:  ') ; %sampling frequency- divide number of readings by time of recording
% filtering; %runs filtering data script
T = 1/Fs;  %sampling period
  %signal length
t = 0 : T : (T * (sig_length-1)); %creates time vector using assumed sampling frequency of Fs
% 
% %create character matrix of signal labels
% channel_label = 1:channels;  %improved if string of characters?
% 
% % create a figure with original and filtered(?) data in
% %spacing signals ??
% 
% % spacing; % spaces out the channels by 1000uV
detect_hfo; %runs the script to detect the HFOs based on potentail within signal in 10hz narrowband sections
% 
% % detector_power; %new scrpt to write. Detection of HFO using local power spectrum 
% % working up to this point somehow??
% 
% 
% % %% this is UI figure 1 
% % % figure;
% % % 
% % % ax1=subplot(2,1,1);
% % %     plot(t,spaced_record);
% % %         title('Unfiltered Signals');
% % %         xlabel('Time in s');
% % %         ylabel('Signal amplitude in uV');
% % %          legend('show'); 
% % % %insert pick list here?
% % % 
% % % 
% % % 
% % % ax2=subplot(2,1,2);
% % %      plot(t,broadband_pass);
% % %         title('Filtered Signals'); %this should be bandpassed signals
% % %         xlabel('Time in s');
% % %         ylabel('Signal amplitude after filtering');
% % %         legend('show');
% % % linkaxes([ax1,ax2], 'xy');
% % % vertical_cursors;  %adds overlay of vertical line cursor displaying point property
% % % %button interactivity
% % % 
% % %     
% % % c = uicontrol; This doesn't work?
% % % c.String = 'Compute';
% % % c.Callback = @plotButtonPushed; % this is the problem area i think?
% % 
% % %when the button is pushed, do this:
% % 
% % read_axis; %reads the axis limits of the chart
% % apply_fourier;
% % 
% 
% 
% figure;
% ax3 = subplot(2,1,1);
%   plot(F_sample(2:end) , P1_norm);
%      title('Frequency components in visible section');
%      xlabel('Frequency (Hz)');
%      ylabel('Normalised contribution');
%      
 %this will be frequency distribution of visible section of the time signal
 %with data filtered
% ax4 = subplot(2,1,2);           DOESNT EXIST YET...
%     plot(F_sample, P1_norm_filtered);
%         title('Frequency components of filtered signal');
%         xlabel('Frequency(Hz)');
%       
%doesn't plot freq until button pushed 

        