function result = isCodeGenSuccessful(this)
    % 1 15
    % 2 15
    % 3 15
    % 4 15
    % 5 15
    % 6 15
    % 7 15
    % 8 15
    % 9 15
    % 10 15
    % 11 15
    % 12 15
    % 13 15
    result = strcmp(this.getStartNodeName, this.LastStartNodeName) && this.CodeGenSuccessful && strcmpi(this.getParameter('target_language'), this.LastTargetLanguage);
    % 15 18
    % 16 18
end
