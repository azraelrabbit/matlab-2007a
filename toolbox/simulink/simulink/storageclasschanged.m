function storageclasschanged(hRTWInfo)
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
    hasCustomStorageClass = not(isempty(findprop(hRTWInfo, 'CustomStorageClass')));
    % 14 16
    switch hRTWInfo.StorageClass
    case 'Custom'
        % 17 22
        % 18 22
        % 19 22
        % 20 22
        if eq(hasCustomStorageClass, 0.0)
            errTxt = 'StorageClass may not be set to ''Custom'' unless RTWInfo has a ''CustomStorageClass'' property'
            errordlg(errTxt, 'Error', 'modal');
            hRTWInfo.StorageClass = 'Auto';
        end
    otherwise
        % 27 30
        % 28 30
    end
end
