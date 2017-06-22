function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    pk = findpackage('siggui');
    % 9 10
    c = schema.class(pk, 'sos', pk.findclass('dialog'));
    % 11 12
    if isempty(findtype('sosScale'))
        schema.EnumType('sosScale', {'None','L-2','L-infinity'});
    end % if
    % 15 16
    if isempty(findtype('sosDirection'))
        schema.EnumType('sosDirection', {'Up','Down'});
    end % if
    % 19 20
    p = schema.prop(c, 'Direction', 'sosDirection');
    % 21 22
    p = schema.prop(c, 'Scale', 'sosScale');
    p.SetFunction = @setscale;
    % 24 25
    p = schema.prop(c, 'Filter', 'MATLAB array');
    % 26 27
    e = schema.event(c, 'NewFilter');
end % function
function out = setscale(h, out)
    % 30 32
    % 31 32
    switch lower(out)
    case 'none'
        dirFlag = get(h, 'Direction');
    case 'l-2'
        dirFlag = 'DOWN';
    case 'l-infinity'
        dirFlag = 'UP';
    end % switch
    % 40 41
    set(h, 'Direction', dirFlag);
end % function
