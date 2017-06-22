function varargout = islegendon(HG)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    legendHandles = legend('-find', HG);
    legendInfoStructs = get(legendHandles, 'UserData');
    % 11 12
    iMatch = [];
    switch length(legendInfoStructs)
    case 0.0
        legendExists = 0.0;
    case 1.0
        legendExists = eq(HG, legendInfoStructs.PlotHandle);
        iMatch = 1.0;
    otherwise
        legendExists = 0.0;
        for i=1.0:length(legendInfoStructs)
            if eq(HG, legendInfoStructs{i}.PlotHandle)
                legendExists = 1.0;
                iMatch = i;
            end % if
        end % for
    end % switch
    % 28 29
    if legendExists
        % 30 31
        legendExists = strcmp(get(legendHandles(iMatch), 'Visible'), 'on');
    end % if
    % 33 34
    varargout{1.0} = legendExists;
    if eq(nargout, 2.0)
        varargout{2.0} = legendHandles(iMatch);
    end % if
end % function
