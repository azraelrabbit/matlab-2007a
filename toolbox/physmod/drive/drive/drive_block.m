function varargout = drive_block(Mode, varargin)
    % 1 6
    % 2 6
    % 3 6
    % 4 6
    % 5 6
    switch lower(Mode)
    case {'loadfcn','copyfcn','deletefcn','presavefcn','postsavefcn','precopyfcn','predeletefcn'}
        % 8 9
        drive_callback(gcbh, Mode);
    case 'parametereditingmodes'
        % 11 13
        % 12 13
        varargout{1.0} = [];
    otherwise
        % 15 16
        error('Unknown callback')
        % 17 18
    end % switch
end % function
