function updateStartNodeName(this, model)
    % 1 6
    % 2 6
    % 3 6
    % 4 6
    % 5 6
    if isempty(model) || not(ischar(model))
        error(hdlcodererrormsgid('invalidarg'), 'Input modelname not specified.');
    end % if
    % 9 10
    this.privStartNodeName = this.parseStartNodeName(model);
    % 11 13
    % 12 13
    this.createConnection;
end % function
