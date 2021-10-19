%% detects HFO using power spectrum of small sections
%%
%function EOI_power_sections = detector_power(record,Fs,lower_bound,upper_bound, sig_length);
%go through channel by channel, chunks of 8192 points, look at power
%spectrum. place marker on sections with interesting power spectrum
dt =1/Fs;
t = 0:dt:dt*(sig_length-1);
section_length = 8192;
rows = ceil(sig_length/section_length);
[channels, sig_length] = size(record);
EOI_power_sections = zeros(rows, sig_length);
EOI_spec_sections = zeros(rows, ceil(sig_length/2));

rel_lower = floor((lower_bound/(Fs/2))* ceil(section_length/2)); %find index number where 80hz value should be, rounded down 
rel_upper = ceil((upper_bound/(Fs/2))* floor(section_length/2)); %find relative position in vector where upper bound should be found
%test set
% test_50hz = sin(2*pi*50*t)+ sin(2*pi*150*t);
%x=sin(2*pi*20*t) + sin(2*pi*50*t);

% how to handle the data here???
figure
hold on
for a= 46
%     X=record(a,:); %select channel 
X= narrowband_filtered(4).filtered_data(a,:);
    channel_spec = zeros(1, ceil(sig_length/2)); 
    channel_power = zeros(1, sig_length);%create zero aray to populate
    n=1;
    for n=1:rows-1 %select sections of channel 
        x=X((n-1)*section_length + 1 : n*section_length);
        y = fft(x); %apply fourier transform
        Pyy = y.*conj(y)/section_length; % calculate power of selection
        f = (0:length(y)-1)*Fs/length(y);  %frequency spectrum 
        
        mirror_value =floor(section_length /2);  %vector of 4096 elements of power spec. 
        
        mirror_half = abs(y(1:mirror_value)); %actual section, absolute value?
        
        f=f(1:mirror_value);  %frequency vector
        %operations on the power spec and frequency spec
        %where in the array are the corresponding values of 80 and 300hz?
        
        % HERE 
       
        
        %now, look at part of the spectrum we are interested in
        
        test_section = mirror_half(rel_lower:rel_upper); %select the relevent section of the fourier transform
        test_f = f(rel_lower:rel_upper);
        %identify peaks in power
        
        
        %how is an abnormal event classified?
        %pick out the actual frequency component?
        
        
       
      %not useful at the moment
        channel_spec(ceil(((n-1)*section_length +1 )/2):floor((n*section_length)/2))=mirror_half; %vector of channel spec in chunks 
        channel_power((n-1)*section_length + 1 :n*section_length)=Pyy;
        
    end
    plot(t,channel_spec);  %<-- this looks very strange
%    EOI_power_sections(a,:)= channel_power;
%    EOI_spec_sections(a,:)= channel_spec; 

end 





%%


