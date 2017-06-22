function varargout = islegendon(HG)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    legendHandles = legend(HG);
    legendInfoStructs = get(legendHandles, 'UserData');
    % 9 10
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
    % 26 27
    if legendExists
        % 28 29
        legendExists = strcmp(get(legendHandles(iMatch), 'Visible'), 'on');
    end % if
    % 31 32
    varargout{1.0} = legendExists;
    if eq(nargout, 2.0)
        varargout{2.0} = legendHandles(iMatch);
    end % if
end % function
