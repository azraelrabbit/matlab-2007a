function mapfileName = getHelpMapfile(mapPath)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    dR = docroot;
    if isempty(dR)
        dR = fullfile(matlabroot, 'help');
    end % if
    % 13 14
    if gt(nargin, 1.0) && not(isempty(mapPath))
        mapfileName = fullfile(dR, mapPath);
    else
        mapfileName = fullfile(dR, 'toolbox', 'rptgen', 'ug', 'rptgen_ug.map');
    end % if
end % function
