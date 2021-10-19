%applies fourier transform to section
signal_section = record(:,76); %take one channel
Fs = 2048;
section_length = 4098;

%create frequency specrtum

[signal_length, channels] = size(signal_section);
F_sample = 0: (Fs/(section_length)): (Fs/2);
ref_length = ceil(section_length /2);
P1_norm = zeros(ceil(section_length/2),ceil (signal_length/section_length) );
figure

hold on
m=1;
for n = 1: section_length: signal_length-section_length +1 %takes sections, plots the fourier transform of each section in one graph
   section = signal_section(n:n+section_length); 
   sample_freq =fft(section); %fourier transform for frequency spectrum in each sample
   
   P2 = abs(sample_freq / section_length); %double sided spectrum
    P1 = P2(1:ref_length);

    P1_norm_element= (P1)/(max(P1)); %normalise single sided spectrum
    P1_norm(:,m) = (P1_norm_element.');
   plot(F_sample(1:end-1),P1_norm);
   m=m+1;
end

