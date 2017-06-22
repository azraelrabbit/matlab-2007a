function tf = v1mode(tf)
    % 1 11
    % 2 11
    % 3 11
    % 4 11
    % 5 11
    % 6 11
    % 7 11
    % 8 11
    % 9 11
    if gt(nargin, 0.0)
        % 11 26
        % 12 26
        % 13 26
        % 14 26
        % 15 26
        % 16 26
        % 17 26
        % 18 26
        % 19 26
        % 20 26
        % 21 26
        % 22 26
        % 23 26
        % 24 26
        try
            com.mathworks.toolbox.rptgencore.tools.RptgenPrefsPanel.setV1Compatibility(tf);
        catch
            % 28 30
            warning('rptgen:setv1mode', lasterr);
        end % try
    else
        try
            tf = com.mathworks.toolbox.rptgencore.tools.RptgenPrefsPanel.getV1Compatibility;
        catch
            warning('rptgen:getV1mode', lasterr);
            % 36 38
            tf = false;
        end % try
        % 39 41
    end % if
