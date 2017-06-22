function drive_callback(handle, event, varargin)
    % 1 25
    % 2 25
    % 3 25
    % 4 25
    % 5 25
    % 6 25
    % 7 25
    % 8 25
    % 9 25
    % 10 25
    % 11 25
    % 12 25
    % 13 25
    % 14 25
    % 15 25
    % 16 25
    % 17 25
    % 18 25
    % 19 25
    % 20 25
    % 21 25
    % 22 25
    % 23 25
    % 24 25
    switch lower(event)
    case 'mask'
        ssc_callback(handle, '');
    case 'loadfcn'
        ssc_callback(handle, 'BLK_POSTLOAD');
    case 'copyfcn'
        ssc_callback(handle, 'BLK_POSTCOPY');
    case 'precopyfcn'
        ssc_callback(handle, 'BLK_PRECOPY');
    case 'predeletefcn'
        ssc_callback(handle, 'BLK_PREDELETE');
    case 'deletefcn'
        ssc_callback(handle, 'BLK_POSTDELETE');
    case 'presavefcn'
        ssc_callback(handle, 'BLK_PRESAVE');
    case 'postsavefcn'
        ssc_callback(handle, 'BLK_POSTSAVE');
    otherwise
        error('Unknown callback');
    end % switch
end % function
