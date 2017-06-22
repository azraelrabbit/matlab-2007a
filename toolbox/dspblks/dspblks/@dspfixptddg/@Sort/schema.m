function schema
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    package = findpackage('dspfixptddg');
    parent = findclass(package, 'DSPDDGBase');
    this = schema.class(package, 'Sort', parent);
    % 12 14
    % 13 14
    m = schema.method(this, 'getDialogSchema');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','string'};
    s.OutputTypes = {'mxArray'};
    % 19 21
    % 20 21
    if isempty(findtype('DSPSortModeEnum'))
        schema.EnumType('DSPSortModeEnum', {'Value and index','Value','Index'});
    end % if
    % 24 25
    if isempty(findtype('DSPSortOrderEnum'))
        schema.EnumType('DSPSortOrderEnum', {'Ascending','Descending'});
    end % if
    % 28 30
    % 29 30
    schema.prop(this, 'otype', 'DSPSortModeEnum');
    schema.prop(this, 'dir', 'DSPSortOrderEnum');
    schema.prop(this, 'sortAlg', 'DSPSortAlgorithmEnum');
end % function
