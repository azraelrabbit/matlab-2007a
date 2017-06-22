function hC = hdlcoderargs(varargin)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    if eq(mod(length(varargin), 2.0), 0.0)
        params = varargin(:);
        curmodel = bdroot;
        if isempty(curmodel)
            error(hdlcodererrormsgid('noopenmodels'), 'There is no default model; please load a model.');
            % 11 13
        end
        % 13 15
        try
            hD = get_param(curmodel, 'HDLCoder');
            snn = hD.getStartNodeName;
        catch
            snn = bdroot;
        end % try
        % 20 23
        % 21 23
        snn = removemodelname(snn, curmodel);
        % 23 25
        if isempty(snn)
            startnode = curmodel;
        else
            if isempty(find_system(curmodel, 'name', snn))
                startnode = curmodel;
            else
                if strcmp(curmodel, snn)
                    startnode = snn;
                else
                    startnode = horzcat(curmodel, '/', snn);
                end
            end
        end
    else
        startnode = varargin{1.0};
        if not(ischar(startnode)) || ne(size(startnode, 1.0), 1.0)
            error(hdlcodererrormsgid('invaliddut'), 'Invalid specification for device under test.');
        end
        params = varargin(2.0:end);
        inputModel = strtok(startnode, '/');
        openSystems = find_system('flat');
        if isempty(openSystems)
            error(hdlcodererrormsgid('noopenmodels'), 'There are no models open; could not find subsystem ''%s''', startnode);
            % 47 49
        end
        % 49 51
        if not(any(strcmp(openSystems, inputModel)))
            if isempty(bdroot)
                error(hdlcodererrormsgid('noopenmodels'), 'There are no models open; could not find subsystem ''%s''', startnode);
                % 53 55
            end
            % 55 57
            startnode = horzcat(bdroot, '/', startnode);
            % 57 59
            if isempty(find_system(bdroot, 'name', varargin{1.0}))
                error(hdlcodererrormsgid('systemnotfound'), 'Could not find subsystem ''%s'' in the model ''%s''', varargin{1.0}, bdroot);
                % 60 62
            end
        end
    end
    % 64 66
    blkdiagram = startnode;
    while not(isempty(get_param(blkdiagram, 'Parent')))
        blkdiagram = get_param(blkdiagram, 'Parent');
    end % while
    % 69 72
    % 70 72
    if not(strcmpi(get_param(blkdiagram, 'LibraryType'), 'None'))
        % 72 74
        error(hdlcodererrormsgid('librarymodel'), 'Cannot generate HDL code for a library.');
        % 74 76
    end
    % 76 78
    attachhdlcconfig(blkdiagram);
    hC = get_param(blkdiagram, 'HDLCoder');
    hC.updateStartNodeName(startnode);
    hC.updateParams(params{:});
end
function snn = removemodelname(snn, curmodel)
    % 83 87
    % 84 87
    % 85 87
    modelname = horzcat(curmodel, '/');
    len_snn = length(snn);
    len_modelname = length(modelname);
    if gt(len_snn, len_modelname)
        % 90 92
        if strcmp(modelname, snn(1.0:len_modelname))
            % 92 94
            snn = snn(plus(len_modelname, 1.0):end);
        end
    end
end
