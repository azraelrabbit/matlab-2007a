function varargout = drive_environmentblock(Mode, varargin)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    switch lower(Mode)
    case {'loadfcn','copyfcn','deletefcn','presavefcn','postsavefcn','precopyfcn','predeletefcn'}
        drive_block(Mode);
    case 'parametereditingmodes'
        % 12 14
        % 13 14
        authoringParams = {'ModeIteration'};
        varargout{1.0} = drive_setparammode(authoringParams);
        % 16 17
    end % switch
end % function
