function cleanup(adSF)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    CloseModels(adSF);
    cleanRtwFiles(adSF);
    % 9 11
    % 10 11
    adSF.reset;
end % function
function CloseModels(z)
    % 14 16
    % 15 16
    okModels = z.PreRunOpenModels;
    % 17 18
    if any(isnan(okModels))
        okModels = [];
    end % if
    % 21 22
    allModels = find_system(0.0, 'SearchDepth', 1.0, 'type', 'block_diagram');
    % 23 26
    % 24 26
    % 25 26
    badModels = setdiff(allModels, okModels);
    % 27 28
    for i=1.0:length(badModels)
        try
            bdclose(badModels(i));
        end % try
    end % for
end % function
function cleanRtwFiles(adSL)
    % 35 38
    % 36 38
    % 37 38
    rtwDir = tempdir;
    for i=1.0:length(adSL.RtwCompiledModels)
        fName = fullfile(rtwDir, horzcat(adSL.RtwCompiledModels{i}, '.rtw'));
        if exist(fName, 'file')
            try
                delete(fName);
            catch
                warning(lasterr);
            end % try
        end % if
    end % for
end % function
