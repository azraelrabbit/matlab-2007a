%  function out = sbiodesktopverifyhandler(action, varargin)
%      % 1 13
%      % 2 13
%      % 3 13
%      % 4 13
%      % 5 13
%      % 6 13
%      % 7 13
%      % 8 13
%      % 9 13
%      % 10 13
%      % 11 13
%      % 12 13
%      switch action
%      otherwise
% MATASS1 36 v% 0 [] []
% SWITCHCMP  43 SWITCHCMP ('matnum=9', '("v%")') {'matnum': '9'}
%      case 'verifyModel'
% IF0 SWITCH 45 ('skip=125', '(to', '172)') {'skip': '125'}
%          % 15 16
% stack: ['1.0'] 1
% MATASS1 62 model 0 [] ['varargin{1.0}']
%          model = varargin{1.0};
%          % 17 18
% MATASS1 71 out 0 [] ['[]']
%          out = [];
%          % 19 21
%          % 20 21
%          try
%              evalc('verify(model)');
% end 91 () {}
%          catch
% MATASS1 104 err 1 [] ['lasterror']
%              err = lasterror;
%              switch err.identifier
%              otherwise
% MATASS1 124 v% 0 [] []
% SWITCHCMP  131 SWITCHCMP ('matnum=10', '("v%")') {'matnum': '10'}
%              case 'SimBiology:interrupt'
% IF0 SWITCH 133 ('skip=14', '(to', '149)') {'skip': '14'}
% MATASS1 145 out 1 [] ['lasterr']
%                  out = lasterr;
% JUMP skip to  168
%              otherwise
% MATASS1 164 out 1 [] ['sbiodesktoperrortranslator(err)']
%                  out = sbiodesktoperrortranslator(err);
%              end % switch
%          end % try
%  end
function out = sbiodesktopverifyhandler(action, varargin)
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
    % 12 13
    switch action
    case 'verifyModel'
        % 15 16
        model = varargin{1.0};
        % 17 18
        out = [];
        % 19 21
        % 20 21
        try
            evalc('verify(model)');
        catch
            err = lasterror;
            switch err.identifier
            case 'SimBiology:interrupt'
                out = lasterr;
            otherwise
                out = sbiodesktoperrortranslator(err);
            end % switch
        end % try
end
