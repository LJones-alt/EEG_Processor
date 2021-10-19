function [pass_boundaries,stop_boundaries,number_filters] = narrowband_filters(lower_bound,upper_bound,narrow_width)

pass_boundaries = lower_bound : narrow_width : upper_bound ;
stop_boundaries = lower_bound - (narrow_width /2) : narrow_width : upper_bound + (narrow_width /2); %<-- changed this to be - width/2

number_filters = (upper_bound - lower_bound) / narrow_width;

end
%fixed


