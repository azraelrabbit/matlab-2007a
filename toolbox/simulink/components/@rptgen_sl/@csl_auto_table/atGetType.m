function [oType, oTypeDisplay] = atGetType(this, propsrc, obj)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    oType = propsrc.getObjectType(obj);
    % 7 9
    if strcmpi(oType, 'block')
        oTypeDisplay = get_param(obj, 'MaskType');
        if isempty(oTypeDisplay)
            oTypeDisplay = get_param(obj, 'BlockType');
        end % if
    else
        if strcmpi(oType, 'system')
            oTypeDisplay = get_param(obj, 'MaskType');
            if isempty(oTypeDisplay)
                oTypeDisplay = oType;
            end % if
        else
            if strcmpi(oType, 'model')
                oTypeDisplay = rptgen.capitalizeFirst(get_param(obj, 'BlockDiagramType'));
            else
                oTypeDisplay = oType;
            end % if
        end % if
    end % if
end % function
