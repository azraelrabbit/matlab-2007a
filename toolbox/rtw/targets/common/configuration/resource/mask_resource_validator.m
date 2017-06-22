function varargout = mask_resource_validator(block, resource_fcn, varargin)
    % 1 39
    % 2 39
    % 3 39
    % 4 39
    % 5 39
    % 6 39
    % 7 39
    % 8 39
    % 9 39
    % 10 39
    % 11 39
    % 12 39
    % 13 39
    % 14 39
    % 15 39
    % 16 39
    % 17 39
    % 18 39
    % 19 39
    % 20 39
    % 21 39
    % 22 39
    % 23 39
    % 24 39
    % 25 39
    % 26 39
    % 27 39
    % 28 39
    % 29 39
    % 30 39
    % 31 39
    % 32 39
    % 33 39
    % 34 39
    % 35 39
    % 36 39
    % 37 39
    simStatus = lower(get_param(bdroot(block), 'SimulationStatus'));
    % 39 41
    switch simStatus
    case {'initializing','updating'}
        % 42 44
        target = RTWConfigurationCB('get_target', block);
        % 44 46
        if ~(target.isBlockRegistered(block))
            varargout = feval(resource_fcn, block, target, varargin{:});
            if (~(iscell(varargout))) | (ne(length(varargout), length(varargin)))
                help('mask_resource_validator');
                error('The number of passed in parameters must be the same as the number of elements in the returned cell array.');
            end
            target.registerBlock(block);
        else
            varargout = varargin;
        end
    case {'stopped','external','terminating'}
        % 56 59
        % 57 59
        varargout = varargin;
    end
end
