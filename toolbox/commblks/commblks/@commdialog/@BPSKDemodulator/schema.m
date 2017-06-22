function schema
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    parentPkg = findpackage('dspdialog');
    parent = findclass(parentPkg, 'DSPDDG');
    commPackage = findpackage('commdialog');
    this = schema.class(commPackage, 'BPSKDemodulator', parent);
    % 13 15
    % 14 15
    m = schema.method(this, 'getDialogSchema');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','string'};
    s.OutputTypes = {'mxArray'};
    % 20 25
    % 21 25
    % 22 25
    % 23 25
    % 24 25
    if isempty(findtype('BPSKDecType'))
        schema.EnumType('BPSKDecType', {'Hard decision','Log-likelihood ratio','Approximate log-likelihood ratio'});
        % 27 29
        % 28 29
    end % if
    % 30 31
    if isempty(findtype('BPSKVarSource'))
        schema.EnumType('BPSKVarSource', {'Dialog','Port'});
        % 33 34
    end % if
    % 35 38
    % 36 38
    % 37 38
    if isempty(findtype('BPSKOutDType'))
        schema.EnumType('BPSKOutDType', {'Inherit via internal rule','Smallest unsigned integer','double','single','int8','uint8','int16','uint16','int32','uint32','boolean'});
        % 40 51
        % 41 51
        % 42 51
        % 43 51
        % 44 51
        % 45 51
        % 46 51
        % 47 51
        % 48 51
        % 49 51
        % 50 51
    end % if
    % 52 53
    schema.prop(this, 'Ph', 'string');
    schema.prop(this, 'DecType', 'BPSKDecType');
    schema.prop(this, 'VarSource', 'BPSKVarSource');
    schema.prop(this, 'Variance', 'string');
    schema.prop(this, 'outDtype', 'BPSKOutDType');
end % function
