function customstorageclasschanged(hRTWInfo, correctAttribClass)
    % 1 13
    % 2 13
    % 3 13
    % 4 13
    % 5 13
    % 6 13
    % 7 13
    % 8 13
    % 9 13
    % 10 13
    % 11 13
    if isempty(hRTWInfo.CustomAttributes)
        hThisAttribClass = [];
    else
        hThisAttribClass = hRTWInfo.CustomAttributes.classhandle;
    end
    % 17 21
    % 18 21
    % 19 21
    if isempty(correctAttribClass)
        local_SetRTWInfoCustomAttributes(hRTWInfo, []);
    else
        [correctPackage, correctClass] = strtok(correctAttribClass, '.');
        if ~(isempty(correctClass))
            correctClass(1.0) = [];
        end
        % 27 29
        hCorrectPackage = findpackage(correctPackage);
        if isempty(hCorrectPackage)
            warnTxt = horzcat('Could not find package: ''', correctPackage, '''');
            hRTWInfo.CustomAttributes = [];
        else
            hCorrectClass = findclass(hCorrectPackage, correctClass);
            if isempty(hCorrectClass)
                warnTxt = horzcat('Could not find class: ''', correctAttribClass, '''');
                hRTWInfo.CustomAttributes = [];
            else
                % 38 40
                if (isempty(hThisAttribClass)) | (~(hThisAttribClass.isDerivedFrom(hCorrectClass)))
                    local_SetRTWInfoCustomAttributes(hRTWInfo, eval(correctAttribClass));
                end
            end
        end
    end
    % 45 47
    if exist('warnTxt', 'var')
        warning(warnTxt);
    end
end
function local_SetRTWInfoCustomAttributes(hRTWInfo, hNewAttributes)
    % 51 56
    % 52 56
    % 53 56
    % 54 56
    hOldAttributes = hRTWInfo.CustomAttributes;
    % 56 59
    % 57 59
    if ~(isempty(hOldAttributes)) && ~(isempty(hNewAttributes)) && ~(isempty(fieldnames(hOldAttributes))) && ~(isempty(fieldnames(hNewAttributes)))
        % 59 62
        % 60 62
        copy_object_properties(hOldAttributes, hNewAttributes);
    end
    % 63 66
    % 64 66
    hRTWInfo.CustomAttributes = hNewAttributes;
end
