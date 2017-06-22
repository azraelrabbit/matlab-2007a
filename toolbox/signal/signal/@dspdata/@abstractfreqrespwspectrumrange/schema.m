function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    pk = findpackage('dspdata');
    c = schema.class(pk, 'abstractfreqrespwspectrumrange', pk.findclass('abstractfreqresp'));
    % 10 11
    set(c, 'Description', 'abstract');
    % 12 15
    % 13 15
    % 14 15
    p = schema.prop(c, 'SpectrumRange', 'SignalFrequencyRangeList');
    set(p, 'AccessFlag.Serialize', 'off', 'AccessFlags.Init', 'Off', 'SetFunction', @set_spectrumrange, 'GetFunction', @get_spectrumrange);
    % 17 24
    % 18 24
    % 19 24
    % 20 24
    % 21 24
    % 22 24
    % 23 24
    p = schema.prop(c, 'privSpectrumRange', 'SignalFrequencyRangeList');
    set(p, 'AccessFlag.PublicSet', 'off', 'AccessFlag.PublicGet', 'off');
    p.FactoryValue = 'Half';
end % function
function spectype = set_spectrumrange(this, spectype)
    % 29 32
    % 30 32
    % 31 32
    msg.identifier = generatemsgid('settingPropertyNotAllowed');
    msg.message = sprintf('Changing the ''SpectrumRange'' property is not allowed.\nUse the halfrange or wholerange method which updates the data and frequencies accordingly.\nType help dspdata/halfrange or help dspdata/wholerange for more information.');
    % 34 36
    % 35 36
    error(msg);
end % function
function specrange = get_spectrumrange(this, spectype)
    % 39 42
    % 40 42
    % 41 42
    specrange = getspectrumtype(this);
end % function
