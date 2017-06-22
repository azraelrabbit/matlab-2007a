function [hdlbody, hdlsignals] = hdlfiltermultiplycsd(in, coeff, coeffptr, out, rounding, saturation)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    [hdlbody, hdlsignals] = hdlmultiplycsd(in, coeff, coeffptr, out, rounding, saturation);
end % function
