function buildDropDownInfo(hThis)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    nPrimitives = numel(hThis.PrimList);
    hThis.Choices = {};
    hThis.Values = [];
    % 10 12
    % 11 12
    for idx=1.0:nPrimitives
        item = hThis.PrimList(idx);
        if isempty(hThis.Choices)
            hThis.Choices{1.0} = item.Name;
            hThis.Values = idx;
        else
            hThis.Choices{plus(end, 1.0)} = item.Name;
            hThis.Values(plus(end, 1.0)) = idx;
        end % if
    end % for
    % 22 23
    if eq(nPrimitives, 0.0)
        hThis.Entries = cellhorzcat(xlate('None'));
        hThis.Values = -1.0;
    end % if
    % 27 28
    if eq(nPrimitives, 1.0)
        hThis.Value = hThis.Choices{1.0};
        hThis.SelIndex = 0.0;
    end % if
    % 32 35
    % 33 35
    % 34 35
    pDropDown = hThis.Items(1.0);
    pDropDown.Value = hThis.Value;
    pDropDown.Choices = hThis.Choices;
    pDropDown.ChoiceVals = hThis.Values;
    pDropDown.EnableStatus = hThis.EnableStatus;
end % function
