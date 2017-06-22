function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    pk = findpackage('fdesign');
    c = schema.class(pk, 'parameq', pk.findclass('abstracttypewspecs'));
    % 10 11
    spectypes = initspectypes;
    % 12 13
    p = schema.prop(c, 'Specification', spectypes);
    set(p, 'SetFunction', @set_specification, 'GetFunction', @get_specification, 'AccessFlags.AbortSet', 'Off');
end % function
function spectypes = initspectypes
    % 17 20
    % 18 20
    % 19 20
    if isempty(findtype('parameqSpecTypes'))
        schema.EnumType('parameqSpecTypes', {'F0,BW,BWp,Gref,G0,GBW,Gp','F0,BW,BWst,Gref,G0,GBW,Gst','F0,BW,BWp,Gref,G0,GBW,Gp,Gst','N,F0,BW,Gref,G0,GBW','N,F0,BW,Gref,G0,GBW,Gp','N,F0,BW,Gref,G0,GBW,Gst','N,F0,BW,Gref,G0,GBW,Gp,Gst','N,Flow,Fhigh,Gref,G0,GBW','N,Flow,Fhigh,Gref,G0,GBW,Gp','N,Flow,Fhigh,Gref,G0,GBW,Gst','N,Flow,Fhigh,Gref,G0,GBW,Gp,Gst'});
        % 22 34
        % 23 34
        % 24 34
        % 25 34
        % 26 34
        % 27 34
        % 28 34
        % 29 34
        % 30 34
        % 31 34
        % 32 34
        % 33 34
    end % if
    % 35 36
    spectypes = 'parameqSpecTypes';
end % function
