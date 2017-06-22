function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    pk = findpackage('fdesign');
    c = schema.class(pk, 'abstractpeaknotch', pk.findclass('abstracttypewspecs'));
    % 10 11
    set(c, 'Description', 'abstract');
    % 12 13
    spectypes = initspectypes;
    % 14 15
    p = schema.prop(c, 'Specification', spectypes);
    set(p, 'SetFunction', @set_specification, 'GetFunction', @get_specification, 'AccessFlags.AbortSet', 'Off');
end % function
function spectypes = initspectypes
    % 19 22
    % 20 22
    % 21 22
    if isempty(findtype('notchSpecTypes'))
        schema.EnumType('notchSpecTypes', {'N,F0,Q','N,F0,Q,Ap','N,F0,Q,Ast','N,F0,Q,Ap,Ast','N,F0,BW','N,F0,BW,Ap','N,F0,BW,Ast','N,F0,BW,Ap,Ast'});
        % 24 33
        % 25 33
        % 26 33
        % 27 33
        % 28 33
        % 29 33
        % 30 33
        % 31 33
        % 32 33
    end % if
    % 34 35
    spectypes = 'notchSpecTypes';
end % function
