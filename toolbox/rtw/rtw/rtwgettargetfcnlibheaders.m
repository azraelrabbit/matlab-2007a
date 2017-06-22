function headers = rtwgettargetfcnlibheaders(model)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    libH = get_param(model, 'TargetFcnLibHandle');
    if isempty(libH)
        headers = [];
    else
        headers = libH.getUsedHeaders();
    end % if
end % function
