function dialogParams = getMaskDlgParams(this, slBlock)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    op = get_param(slBlock, 'dialogparameters');
    % 8 10
    if isempty(op)
        dialogParams = [];
        return;
    end % if
    % 13 15
    f = fieldnames(op);
    % 15 18
    % 16 18
    i = strmatch('TemplateBlock', f);
    f(i) = [];
    i = strmatch('MemberBlocks', f);
    f(i) = [];
    i = strmatch('ParameterArgumentNames', f);
    f(i) = [];
    i = strmatch('ParameterArgumentValues', f);
    f(i) = [];
    i = strmatch('AvailSigsDefaultProps', f);
    f(i) = [];
    i = strmatch('UpdateSigLoggingInfo', f);
    f(i) = [];
    for i=1.0:length(f)
        v{i, 1.0} = get_param(slBlock, f{i});
    end % for
    pv = horzcat(f, v);
    % 33 35
    dialogParams = pv;
    % 35 37
end % function
