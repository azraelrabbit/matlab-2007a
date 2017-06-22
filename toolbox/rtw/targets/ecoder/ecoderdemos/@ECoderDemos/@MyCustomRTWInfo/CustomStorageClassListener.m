function CustomStorageClassListener(hRTWInfo)
    % 1 18
    % 2 18
    % 3 18
    % 4 18
    % 5 18
    % 6 18
    % 7 18
    % 8 18
    % 9 18
    % 10 18
    % 11 18
    % 12 18
    % 13 18
    % 14 18
    % 15 18
    % 16 18
    % 17 18
    thisCSC = hRTWInfo.CustomStorageClass;
    switch thisCSC
    case 'BasicStruct'
        correctAttribClass = '';
    case 'AdvancedStruct'
        correctAttribClass = 'ECoderDemos.AdvStruct_Attribs';
    case 'Mutex'
        correctAttribClass = '';
    case 'PriorityCeiling'
        correctAttribClass = '';
    otherwise
        warning(horzcat('Unknown CustomStorageClass, ''', thisCSC, ''''));
        return;
    end % switch
    % 32 34
    % 33 34
    customstorageclasschanged(hRTWInfo, correctAttribClass);
end % function
