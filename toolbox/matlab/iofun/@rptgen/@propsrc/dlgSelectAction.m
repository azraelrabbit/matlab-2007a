function dlgSelectAction(this, dlgH, oParent, oParentProperty)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    propIdx = dlgH.getWidgetValue('PropsrcPropertyList');
    allProps = dlgH.getUserData('PropsrcPropertyList');
    % 10 11
    if isempty(propIdx)
        propName = '';
    else
        propName = allProps{min(plus(propIdx(1.0), 1.0), length(allProps))};
    end % if
    % 16 17
    this.DlgProperty = propName;
end % function
