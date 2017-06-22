function cvclean(varargin)
    % 1 13
    % 2 13
    % 3 13
    % 4 13
    % 5 13
    % 6 13
    % 7 13
    % 8 13
    % 9 13
    % 10 13
    % 11 13
    if eq(length(varargin), 0.0)
        do_clean_all
    else
        for this_arg=ctranspose(varargin)
            if strcmp(upper(this_arg), 'ALL')
                do_clean_all;
            else
                modelcov_id = cv('find', 'all', 'modelcov.name', this_arg{1.0});
                if not(isempty(modelcov_id))
                    do_clean_model(modelcov_id, 1.0);
                end
            end
        end % for
    end
end
function do_clean_all
    % 28 30
    modelcov_ids = cv('get', 'all', 'modelcov.id');
    % 30 32
    for this_id=ctranspose(modelcov_ids)
        do_clean_model(this_id, 0.0)
    end % for
end
function do_clean_model(modelcov_id, warn)
    % 36 38
    modelname = cv('get', modelcov_id, '.name');
    % 38 40
    if isempty(find_system('name', modelname))
        cleanmodel(modelcov_id);
    else
        if warn
            warning(sprintf('Model %s is open and could not be cleared.  Close %s and try again.', modelname, modelname));
        end
    end
end
function cleanmodel(modelcov_id)
    informerUddObj = cv('get', modelcov_id, '.currentDisplay.informer');
    if not(isempty(informerUddObj))
        eval(informerUddObj.preCloseFcn);
        informerUddObj.hide;
    end
    % 53 56
    % 54 56
    cv('ClearModel', modelcov_id);
end
