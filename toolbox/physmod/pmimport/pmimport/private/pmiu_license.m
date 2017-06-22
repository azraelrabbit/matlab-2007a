function pmiu_license(option)
    % 1 23
    % 2 23
    % 3 23
    % 4 23
    % 5 23
    % 6 23
    % 7 23
    % 8 23
    % 9 23
    % 10 23
    % 11 23
    % 12 23
    % 13 23
    % 14 23
    % 15 23
    % 16 23
    % 17 23
    % 18 23
    % 19 23
    % 20 23
    % 21 23
    if lt(nargin, 1.0)
        option = 'PromptLicense';
    end % if
    % 25 28
    % 26 28
    if strcmpi(option, 'PromptLicense')
        try
            callgraphviz('SimMechanics', 'PromptLicense');
        catch
            error('physmod:import:MustAgreeToLicense', 'You must agree with the license terms to proceed.');
        end % try
    else
        if strcmpi(option, 'DisplayLicense')
            callgraphviz('SimMechanics', 'DisplayLicense');
        else
            error('physmod:import:license:UnknownOption', 'Unknown option to pmiu_license');
        end % if
    end % if
end % function
