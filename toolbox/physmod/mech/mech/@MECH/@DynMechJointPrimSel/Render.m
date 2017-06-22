function [retVal, schema] = Render(hThis, schema)
    % 1 14
    % 2 14
    % 3 14
    % 4 14
    % 5 14
    % 6 14
    % 7 14
    % 8 14
    % 9 14
    % 10 14
    % 11 14
    % 12 14
    retVal = true;
    % 14 16
    if lt(numel(hThis.Items), 0.0)
        retVal = false;
        error('DynMechJointPrimSel::Render:InvalidSchema', xlate('Incorrect schema passed to BuildFromSchema.'));
    end
    % 19 21
    dropDownItem = hThis.Items(1.0);
    % 21 23
    if ~(isempty(hThis.SrcObject)) && ~(isempty(hThis.ObjectMethod))
        listener = @(source,dialog,value,tag)hThis.OnSelectChange(source,dialog,value,tag);
        dropDownItem.addListener(listener);
    end
    % 26 28
    if ~(isempty(hThis.MatlabMethod))
        error('should never reach this point: MatlabMethod not authorized.');
    end
    % 30 32
    childItems = {};
    [retVal, childItems] = renderChildren(hThis, childItems);
    % 33 36
    % 34 36
    nPanels = numel(childItems);
    for idx=1.0:nPanels
        childItems{idx}.RowSpan = horzcat(idx, idx);
    end % for
    % 39 41
    grpPanel.Name = hThis.Label;
    grpPanel.Type = 'panel';
    grpPanel.RowSpan = [1.0 1.0];
    grpPanel.ColSpan = [1.0 1.0];
    grpPanel.LayoutGrid = horzcat(nPanels, 1.0);
    grpPanel.Items = childItems;
    grpPanel.RowStretch = zeros(1.0, nPanels);
    % 47 49
    schema = grpPanel;
end
