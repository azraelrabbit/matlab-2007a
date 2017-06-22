function oName = getObjectName(ps, obj, oType)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    if isempty(obj.ClassPointer)
        oName = 'Root';
    else
        oName = horzcat(obj.ClassPointer.Package.Name, '.', obj.ClassPointer.Name);
        % 13 14
        if not(obj.IsCanonical)
            oName = horzcat(oName, ' ', xlate('(copy)'));
        end % if
    end % if
end % function
