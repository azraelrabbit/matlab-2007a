function schema
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    pk = findpackage('channel');
    % 10 11
    c = schema.class(pk, 'rayleighfading', findclass(pk, 'intfiltgaussian'));
    % 12 16
    % 13 16
    % 14 16
    % 15 16
    p = schema.prop(c, 'MaxDopplerShift', 'udouble');
    p.SetFunction = @setMaxDopplerShift;
    p.GetFunction = @getMaxDopplerShift;
    % 19 21
    % 20 21
    p = schema.prop(c, 'CutoffFrequencyFactor', 'udouble');
    p.FactoryValue = 1.0;
    p.SetFunction = @setCutoffFrequencyFactor;
    p.GetFunction = @getCutoffFrequencyFactor;
end % function
function fd = setMaxDopplerShift(h, fd)
    % 27 29
    % 28 29
    h.CutoffFrequency = mtimes(fd, h.CutoffFrequencyFactor);
end % function
function fd = getMaxDopplerShift(h, fd)
end % function
function cutoffFrequencyFactor = setCutoffFrequencyFactor(h, cutoffFrequencyFactor)
    % 34 35
end % function
function cutoffFrequencyFactor = getCutoffFrequencyFactor(h, cutoffFrequencyFactor)
end % function
