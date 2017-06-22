function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    package = findpackage('dspfixptddg');
    parent = findclass(package, 'DSPDDGBase');
    this = schema.class(package, 'Difference', parent);
    % 11 13
    % 12 13
    m = schema.method(this, 'getDialogSchema');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','string'};
    s.OutputTypes = {'mxArray'};
    % 18 20
    % 19 20
    if isempty(findtype('DSPMatrixDirectionEnum'))
        schema.EnumType('DSPMatrixDirectionEnum', {'Rows','Columns'});
    end % if
    % 23 25
    % 24 25
    schema.prop(this, 'dim', 'DSPMatrixDirectionEnum');
end % function
