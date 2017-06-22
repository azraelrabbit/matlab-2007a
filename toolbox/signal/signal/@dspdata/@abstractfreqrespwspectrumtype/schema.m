function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    pk = findpackage('dspdata');
    c = schema.class(pk, 'abstractfreqrespwspectrumtype', pk.findclass('abstractfreqresp'));
    % 10 11
    set(c, 'Description', 'abstract');
    % 12 13
    p = schema.prop(c, 'SpectrumType', 'SignalSpectrumTypeList');
    set(p, 'AccessFlag.Serialize', 'off', 'AccessFlags.Init', 'Off', 'SetFunction', @set_spectrumtype, 'GetFunction', @get_spectrumtype);
    % 15 22
    % 16 22
    % 17 22
    % 18 22
    % 19 22
    % 20 22
    % 21 22
    p = schema.prop(c, 'privSpectrumType', 'SignalSpectrumTypeList');
    set(p, 'AccessFlag.PublicSet', 'off', 'AccessFlag.PublicGet', 'off');
    p.FactoryValue = 'OneSided';
end % function
function spectype = set_spectrumtype(this, spectype)
    % 27 30
    % 28 30
    % 29 30
    msg.identifier = generatemsgid('settingPropertyNotAllowed');
    msg.message = sprintf('Changing the ''SpectrumType'' property is not allowed.\nUse the onesided or twosided method which updates the data and frequencies accordingly.\nType help dspdata/onesided or help dspdata/twosided for more information.');
    % 32 34
    % 33 34
    error(msg);
end % function
function spectype = get_spectrumtype(this, spectype)
    % 37 40
    % 38 40
    % 39 40
    spectype = getspectrumtype(this);
end % function
