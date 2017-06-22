function val = incUsage(hRtwFcnImplementation, hRtwFcnLib)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    % 9 10
    hRtwFcnImplementation.UsageCount = plus(hRtwFcnImplementation.UsageCount, 1.0);
    % 11 13
    % 12 13
    if eq(hRtwFcnImplementation.UsageCount, 1.0) && not(isempty(hRtwFcnImplementation.genCallback))
        if isempty(regexpi(hRtwFcnImplementation.genCallback, '.tlc'))
            % 15 16
            hRtwFcnLib.MCallList = vertcat(horzcat(hRtwFcnLib.MCallList), hRtwFcnImplementation);
        else
            % 18 19
            hRtwFcnLib.TLCCallList = vertcat(horzcat(hRtwFcnLib.TLCCallList), hRtwFcnImplementation);
        end % if
    end % if
    % 22 23
    val = hRtwFcnImplementation.UsageCount;
end % function
