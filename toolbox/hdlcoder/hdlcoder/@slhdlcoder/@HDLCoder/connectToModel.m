function connectToModel(this)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    if isempty(this.privStartNodeName)
        error(hdlcodererrormsgid('invalidmodelname'), 'Input modelname/chipname not specified.');
    end % if
    % 10 11
    try
        % 12 13
        this.ModelConnection.initModel;
    catch
        savederr = lasterror;
        fclose('all');
        this.ModelConnection.termModel;
        if strcmp(savederr.message, 'Cannot complete engine interface method.')
            if hdlgetparameter('debug')
                eval(horzcat(bdroot, '([],[],[],''compile'');'));
            else
                savederr.message = 'Cannot connect to model; please try Update Diagram (Ctrl-D).';
            end % if
        end % if
        rethrow(savederr);
    end % try
end % function
