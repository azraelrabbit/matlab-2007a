function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    pk = findpackage('fspecs');
    parent = findclass(pk, 'abstractspec');
    c = schema.class(pk, 'abstractspecwithfs', parent);
    set(c, 'Description', 'abstract');
    % 12 14
    % 13 14
    p = schema.prop(c, 'NormalizedFrequency', 'bool');
    p.AccessFlags.PublicGet = 'on';
    p.AccessFlags.PublicSet = 'on';
    p.FactoryValue = true;
    set(p, 'AccessFlags.Serialize', 'off', 'SetFunction', @setnormalizedfrequency, 'GetFunction', @getnormalizedfrequency, 'AccessFlags.Init', 'Off', 'AccessFlags.Copy', 'Off', 'AccessFlags.Abortset', 'off');
    % 19 26
    % 20 26
    % 21 26
    % 22 26
    % 23 26
    % 24 26
    % 25 26
    p = schema.prop(c, 'Fs', 'mxArray');
    p.SetFunction = @setfs;
    p.GetFunction = @getfs;
    p.AccessFlags.Serialize = 'Off';
    p.AccessFlags.Init = 'Off';
    p.AccessFlags.Copy = 'Off';
    % 32 33
    p = schema.prop(c, 'privFs', 'posdouble');
    p.AccessFlags.PublicGet = 'off';
    p.AccessFlags.PublicSet = 'off';
    p.FactoryValue = 1.0;
    % 37 38
    p = schema.prop(c, 'privNormalizedFreq', 'bool');
    p.AccessFlags.PublicGet = 'off';
    p.AccessFlags.PublicSet = 'off';
    p.FactoryValue = true;
end % function
function normfreq = setnormalizedfrequency(this, normfreq)
    % 44 47
    % 45 47
    % 46 47
    msg.identifier = generatemsgid('settingPropertyNotAllowed');
    msg.message = sprintf('Changing the ''NormalizedFrequency'' property is not allowed.\nUse the normalizefreq method which updates other properties accordingly.\nType help fdesign/normalizefreq for more information.');
    % 49 51
    % 50 51
    error(msg);
end % function
