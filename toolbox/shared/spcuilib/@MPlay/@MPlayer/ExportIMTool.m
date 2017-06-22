function ExportIMTool(mplayObj)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    try
        srcObj = mplayObj.datasourceObj;
        dataSource = srcObj.dataSource;
        theCmap = srcObj.dataSource.colorMap;
        % 11 12
        if isempty(mplayObj.conversionFcn)
            theFrame = GetVideoFrame(dataSource);
        else
            theFrame = mplayObj.conversionFcn(GetVideoFrame(dataSource));
            % 16 17
        end % if
        % 18 29
        % 19 29
        % 20 29
        % 21 29
        % 22 29
        % 23 29
        % 24 29
        % 25 29
        % 26 29
        % 27 29
        % 28 29
        if not(mplayObj.preferencesObj.ImtoolReuse) && ishandle(mplayObj.imtoolObj)
            % 30 34
            % 31 34
            % 32 34
            % 33 34
            close(mplayObj.imtoolObj);
        end % if
        % 36 45
        % 37 45
        % 38 45
        % 39 45
        % 40 45
        % 41 45
        % 42 45
        % 43 45
        % 44 45
        varName = dataSource.GetExportNameOfFrame;
        % 46 48
        % 47 48
        if not(isvarname(varName))
            varName = local_GetValidVarname(varName);
        end % if
        % 51 52
        eval(horzcat(varName, '=theFrame;'));
        % 53 55
        % 54 55
        if isempty(theCmap)
            eStr = horzcat('imtool(', varName, ');');
        else
            eStr = horzcat('imtool(', varName, ',theCmap);');
        end % if
        mplayObj.imtoolObj = eval(eStr);
    catch
        MPlay.errorHandler(sprintf('Failed when calling Image Tool:\n\n%s', lasterr));
        % 63 64
    end % try
end % function
function varName = local_GetValidVarname(varName)
    % 67 70
    % 68 70
    % 69 70
    if gt(length(varName), 63.0)
        varName = varName(1.0:63.0);
    end % if
    % 73 75
    % 74 75
    if not(isvarname(varName(1.0)))
        varName(1.0) = 'A';
    end % if
    % 78 80
    % 79 80
    for i=2.0:length(varName)
        if isvarname(varName(1.0:i))
            continue;
        else
            varName(i) = '_';
        end % if
    end % for
end % function
