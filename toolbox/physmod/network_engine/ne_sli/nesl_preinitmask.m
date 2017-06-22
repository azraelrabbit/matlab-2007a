function nesl_preinitmask(hBlk)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    isLicensed = nesl_checklicense(hBlk);
    % 10 11
    if eq(isLicensed, false)
        % 12 13
        objList = find_system(hBlk, 'findall', 'on', 'SearchDepth', 2.0, 'FollowLinks', 'off', 'LookUnderMasks', 'all', 'type', 'block', 'mask', 'on');
        % 14 16
        % 15 16
        nObjs = size(objList);
        for idx=1.0:nObjs(1.0)
            hObj = objList(idx);
            dispScript = sprintf('color(''red'');\ndisp(''%s\\n%s'');', 'No', 'License');
            set_param(hObj, 'MaskDisplay', dispScript);
            set_param(hObj, 'MaskIconFrame', 'on');
        end % for
    end % if
end % function
