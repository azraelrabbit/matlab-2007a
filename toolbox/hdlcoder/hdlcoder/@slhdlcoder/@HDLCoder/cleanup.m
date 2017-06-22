function cleanup(this, oldDriver, oldMode, codegenstatus, closeconnection)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    if lt(nargin, 5.0)
        closeconnection = true;
    end % if
    % 10 12
    % 11 12
    if closeconnection
        % 13 14
        this.closeConnection;
    end % if
    % 16 18
    % 17 18
    hdlcurrentdriver(oldDriver);
    hdlcodegenmode(oldMode);
    % 20 22
    % 21 22
    this.TimeStamp = datestr(now, 31.0);
    this.CodeGenSuccessful = codegenstatus;
    this.LastStartNodeName = this.privStartNodeName;
    this.LastTargetLanguage = this.getParameter('target_language');
end % function
