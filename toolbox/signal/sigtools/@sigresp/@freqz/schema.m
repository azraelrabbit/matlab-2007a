function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    pk = findpackage('sigresp');
    c = schema.class(pk, 'freqz', findclass(pk, 'freqaxiswfreqrange'));
    % 9 12
    % 10 12
    p = schema.prop(c, 'MagnitudeDisplay', 'string');
    set(p, 'SetFunction', @setmag, 'GetFunction', @getmag);
    % 13 15
    findclass(findpackage('dspdata'), 'abstractfreqresp');
    p = schema.prop(c, 'Spectrum', 'dspdata.abstractfreqresp');
    set(p, 'SetFunction', @setspectrum, 'GetFunction', @getspectrum);
    % 17 20
    % 18 20
    p = vertcat(schema.prop(c, 'PowerResponseListeners', 'handle.listener vector'), schema.prop(c, 'privSpectrum', 'dspdata.abstractfreqresp'));
    % 20 24
    % 21 24
    % 22 24
    set(p, 'AccessFlags.PublicSet', 'off', 'AccessFlags.PublicGet', 'off');
end % function
function out = setmag(this, out)
    % 26 29
    % 27 29
    hPrm = getparameter(this, getmagdisplaytag(this));
    if not(isempty(hPrm))
        setvalue(hPrm, out);
    end % if
end % function
function out = getmag(this, out)
    hPrm = getparameter(this, getmagdisplaytag(this));
    if not(isempty(hPrm))
        out = get(hPrm, 'Value');
    else
        out = '';
    end % if
end % function
