function hc = hdlmodeldriver(modelname)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    try
        % 9 10
        if isempty(find_system('type', 'block_diagram', 'name', modelname))
            error(hdlcodererrormsgid('invalidmodelname'), 'Invalid model name');
            % 12 13
        end % if
        % 14 15
        hc = get_param(modelname, 'HDLCoder');
    catch
        hc = [];
    end % try
end % function
