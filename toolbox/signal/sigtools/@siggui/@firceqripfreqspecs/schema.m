function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    pk = findpackage('siggui');
    % 9 11
    % 10 11
    c = schema.class(pk, 'firceqripfreqspecs', pk.findclass('freqframe'));
    set(c, 'Description', 'Frequency Specifications');
    % 13 15
    % 14 15
    p = schema.prop(c, 'AutoUpdate', 'on/off');
    % 16 17
    if isempty(findtype('fireqrip_FreqOpts'))
        schema.EnumType('fireqrip_FreqOpts', {'cutoff','passedge','stopedge'});
    end % if
    % 20 22
    % 21 22
    p = schema.prop(c, 'freqSpecType', 'fireqrip_FreqOpts');
    % 23 25
    % 24 25
    p = schema.prop(c, 'Dynamic_Prop_Handles', 'schema.prop vector');
    p.AccessFlags.PublicSet = 'off';
    p.AccessFlags.PublicGet = 'off';
end % function
