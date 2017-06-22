function varargout = drive_handleerror(action, varargin)
    % 1 24
    % 2 24
    % 3 24
    % 4 24
    % 5 24
    % 6 24
    % 7 24
    % 8 24
    % 9 24
    % 10 24
    % 11 24
    % 12 24
    % 13 24
    % 14 24
    % 15 24
    % 16 24
    % 17 24
    % 18 24
    % 19 24
    % 20 24
    % 21 24
    % 22 24
    switch action
    case 'save_flags'
        [oldState.lastSimulinkError, oldState.lastMatlabError, oldState.lastSimulinkWarning, oldState.lastMatlabWarning] = save_flags;
        % 26 29
        % 27 29
        varargout{1.0} = oldState;
    case 'restore_flags'
        newState = varargin{1.0};
        restore_flags(newState.lastSimulinkError, newState.lastMatlabError, newState.lastSimulinkWarning, newState.lastMatlabWarning);
    case 'clear_flags'
        % 33 35
        clear_flags;
    case 'report'
        preamble = varargin{1.0};
        report(preamble)
    otherwise
        error('physmod:drive:handleerror:unknownaction', 'Unknown action requested in drive_handlerror');
        % 40 43
        % 41 43
    end % switch
function [lastSimulinkError, lastMatlabError, lastSimulinkWarning, lastMatlabWarning] = save_flags
    % 44 53
    % 45 53
    % 46 53
    % 47 53
    % 48 53
    % 49 53
    % 50 53
    % 51 53
    lastSimulinkError = sllasterror;
    lastMatlabError = lasterror;
    lastSimulinkWarning = sllastwarning;
    lastMatlabWarning = lastwarn;
function restore_flags(lastSimulinkError, lastMatlabError, lastSimulinkWarning, lastMatlabWarning)
    % 57 64
    % 58 64
    % 59 64
    % 60 64
    % 61 64
    % 62 64
    sllasterror(lastSimulinkError);
    lasterror(lastMatlabError);
    sllastwarning(lastSimulinkWarning);
    lastwarn(lastMatlabWarning);
function clear_flags
    % 68 74
    % 69 74
    % 70 74
    % 71 74
    % 72 74
    sllasterror([]);
    lasterr('');
    sllastwarning([]);
    lastwarn('');
function report(preamble)
    % 78 85
    % 79 85
    % 80 85
    % 81 85
    % 82 85
    % 83 85
    slError = sllasterror;
    if not(isempty(slError))
        slError = slError.Message;
    else
        slError = '';
    end % if
    slWarning = sllastwarning;
    if not(isempty(slWarning))
        slWarning = slWarning.Message;
    else
        slWarning = '';
    end % if
    % 96 99
    % 97 99
    matError = lasterr;
    matWarning = lastwarn;
    % 100 102
    fprintf(1.0, horzcat(preamble, '\nsllasterror==\n%s\nlasterr==\n%s\n', '\nsllasterror==\n%s\nlasterr==\n%s\n'), slError, matError, slWarning, matWarning);
    % 102 105
    % 103 105
