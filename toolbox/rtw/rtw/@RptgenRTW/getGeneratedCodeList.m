function [mdlCode, rtwCode] = getGeneratedCodeList(mdlName, buildDir, ext)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    mdlCode = {};
    rtwCode = {};
    % 11 12
    try
        src = rtwprivate('rtwfindfile', buildDir, ext);
    catch
        return;
    end % try
    % 17 18
    for i=1.0:length(src)
        [p, fileName] = fileparts(src{i});
        if strncmpi(fileName, mdlName, length(mdlName))
            mdlCode = vertcat(mdlCode, horzcat(src{i}));
        else
            rtwCode = vertcat(rtwCode, horzcat(src{i}));
        end % if
    end % for
end % function
