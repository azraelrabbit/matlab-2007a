function varargout = canlib_asap2_daq_utils(util, varargin)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    switch lower(util)
    case 'normalbuild'
        varargout{1.0} = internal_normal_build;
    case 'originalhandle'
        varargout{1.0} = internal_original_handle;
    case 'totalnumodts'
        varargout{1.0} = internal_total_num_odts;
    end % switch
end % function
function total_num_odts = internal_total_num_odts
    tempVar = canlib.Signal;
    total_num_odts = tempVar.Configuration.total_num_odts;
end % function
function original_handle = internal_original_handle
    % 21 24
    % 22 24
    % 23 24
    original_handle = rtwprivate('rtwattic', 'AtticData', 'OrigBlockHdl');
end % function
function normal_build = internal_normal_build
    % 27 29
    % 28 29
    normal_build = 1.0;
    Context = dbstack;
    for i=1.0:length(Context)
        if strfind(Context(i).name, 'ssgencode')
            normal_build = 0.0;
            return;
        end % if
    end % for
end % function
