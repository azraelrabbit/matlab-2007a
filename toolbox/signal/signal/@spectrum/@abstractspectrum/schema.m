function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    pk = findpackage('spectrum');
    % 9 10
    findpackage('sigdatatypes');
    % 11 12
    c = schema.class(pk, 'abstractspectrum');
    % 13 15
    % 14 15
    p = schema.prop(c, 'EstimationMethod', 'string');
    p.AccessFlags.PublicSet = 'off';
    p.AccessFlags.Serialize = 'off';
    % 18 20
    % 19 20
    if isempty(findtype('SignalSpectrumNFFT'))
        schema.EnumType('SignalSpectrumNFFT', {'InputLength','NextPow2','UserDefined'});
        % 22 23
    end % if
    p = schema.prop(c, 'FFTLength', 'SignalSpectrumNFFT');
    p.Accessflags.init = 'off';
    p.Accessflags.AbortSet = 'off';
    p.SetFunction = @setfftlength;
    p.GetFunction = @getfftlength;
    p.Visible = 'off';
    % 30 33
    % 31 33
    % 32 33
    p = schema.prop(c, 'privFFTLength', 'SignalSpectrumNFFT');
    p.FactoryValue = 'NextPow2';
    p.AccessFlags.PublicSet = 'off';
    p.AccessFlags.PublicGet = 'off';
    % 37 39
    % 38 39
    if isempty(findtype('SignalSpectrumPercent'))
        schema.UserType('SignalSpectrumPercent', 'double', @checkpercent);
    end % if
end % function
function checkpercent(val)
    % 44 46
    % 45 46
    if lt(val, 0.0) || gt(val, 100.0)
        error('Invalid value.  Value must be between 0 and 100.');
    end % if
end % function
