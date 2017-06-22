function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    pk = findpackage('fdesign');
    c = schema.class(pk, 'highpass', pk.findclass('abstracttypewspecs'));
    % 10 11
    specs = initspectypes;
    % 12 13
    p = schema.prop(c, 'Specification', specs);
    set(p, 'SetFunction', @set_specification, 'GetFunction', @get_specification, 'AccessFlags.AbortSet', 'Off');
end % function
function spectype = initspectypes
    % 17 20
    % 18 20
    % 19 20
    if isempty(findtype('highpassSpecTypeswFDTbx'))
        schema.EnumType('highpassSpecTypeswFDTbx', {'Fst,Fp,Ast,Ap','N,F3dB','N,F3dB,Ap','N,F3dB,Ast','N,F3dB,Ast,Ap','N,F3dB,Fp','N,Fc','N,Fc,Ast,Ap','N,Fp,Ap','N,Fp,Ast,Ap','N,Fst,Ast','N,Fst,Ast,Ap','N,Fst,F3dB','N,Fst,Fp','N,Fst,Fp,Ap','N,Fst,Fp,Ast','Nb,Na,Fst,Fp'});
        % 22 39
        % 23 39
        % 24 39
        % 25 39
        % 26 39
        % 27 39
        % 28 39
        % 29 39
        % 30 39
        % 31 39
        % 32 39
        % 33 39
        % 34 39
        % 35 39
        % 36 39
        % 37 39
        % 38 39
    end % if
    % 40 41
    if isempty(findtype('highpassSpecTypes'))
        schema.EnumType('highpassSpecTypes', {'Fst,Fp,Ast,Ap','N,F3dB','N,F3dB,Ap','N,F3dB,Ast','N,F3dB,Fp','N,Fc','N,Fp,Ap','N,Fp,Ast,Ap','N,Fst,Ast','N,Fst,F3dB','N,Fst,Fp'});
        % 43 54
        % 44 54
        % 45 54
        % 46 54
        % 47 54
        % 48 54
        % 49 54
        % 50 54
        % 51 54
        % 52 54
        % 53 54
    end % if
    % 55 56
    if isfdtbxinstalled
        spectype = 'highpassSpecTypeswFDTbx';
    else
        spectype = 'highpassSpecTypes';
    end % if
end % function
