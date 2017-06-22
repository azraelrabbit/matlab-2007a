function initSuccessState(this)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    this.TimeStamp = datestr(now, 31.0);
    this.CodeGenSuccessful = false;
    this.LastStartNodeName = '';
    this.LastTargetLanguage = '';
end % function
