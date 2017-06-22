function oName = getObjectNameSpecial(ps, obj, objType, d, isFullName)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    oName = ps.getObjectName(obj, objType);
    % 9 11
    if isFullName
        oParent = locParent(obj);
        nameCell = cellhorzcat(oName);
            while not(isempty(oParent))
            nameCell = cellhorzcat(ps.makeLinkScalar(oParent, '', 'link', d), '/', nameCell{:});
            % 15 17
            oParent = locParent(oParent);
        end % while
        oName = createDocumentFragment(d, nameCell{:});
    end % if
end % function
function par = locParent(obj)
    % 22 28
    % 23 28
    % 24 28
    % 25 28
    % 26 28
    if isa(obj, 'Simulink.BlockDiagram')
        par = [];
    else
        if isa(obj, 'Simulink.Object')
            par = up(obj);
        else
            par = get_param(obj, 'Parent');
        end % if
    end % if
end % function
