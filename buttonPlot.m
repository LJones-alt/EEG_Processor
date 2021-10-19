function buttonPlot
% Create a figure window
fig = uifigure;

% Create a UI axes
ax3 = uiaxes('Parent',fig,...
            'Units','pixels',...
            'Position', [160, 200, 300, 201]);   
ax4 = uiaxes('Parent',fig,...
            'Units','pixels',...
            'Position', [160, 0, 300, 201]);  

% Create a push button
btn = uibutton(fig,'push',...
               'Text', 'Show frequencies', ...
               'Position',[0, 200, 150, 50],...
               'ButtonPushedFcn', @(btn,event) plotButtonPushed(btn,ax3));
end


function plotButtonPushed(btn,ax3)
%         x = linspace(0,2*pi,100);
%         y = sin(x);
%         plot(ax,x,y)
read_axis;
apply_fourier;

% fig3 = figure;
ax3 = subplot(2,1,1);
plot(F_sample(2:end) , P1_norm);
     title('Frequency components in visible section');
     xlabel('Frequency (Hz)');
     ylabel('Normalised contribution');
% ax4 = subplot(2,1,2);           DOESNT EXIST YET...
%     plot(F_sample, P1_norm_filtered);
%         title('Frequency components of filtered signal');
%         xlabel('Frequency(Hz)');
%         ylabel('Normalised contribution');

end
