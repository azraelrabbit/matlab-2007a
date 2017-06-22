%  function uitxt = subsasgn(uitxt, property, newval)
%      % 1 8
%      % 2 8
%      % 3 8
%      % 4 8
%      % 5 8
%      % 6 8
%      % 7 8
%      switch property.type
%      otherwise
% MATASS1 43 v% 0 [] []
% SWITCHCMP  50 SWITCHCMP ('matnum=8', '("v%")') {'matnum': '8'}
%      case '.'
% IF0 SWITCH 52 ('skip=108', '(to', '162)') {'skip': '108'}
%          switch property.subs
%          otherwise
% MATASS1 71 v% 0 [] []
% SWITCHCMP  78 SWITCHCMP ('matnum=9', '("v%")') {'matnum': '9'}
%          case 'Notes'
% IF0 SWITCH 80 ('skip=22', '(to', '104)') {'skip': '22'}
%              uitxt.Notes = newval;
% JUMP skip to  160
%          otherwise
% MATASS1 124 hgObj 0 [] ['uitxt.axischild']
%              hgObj = uitxt.axischild;
%              uitxt.axischild = subsasgn(hgObj, property, newval);
%          end % switch
%  end
function uitxt = subsasgn(uitxt, property, newval)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    switch property.type
    case '.'
        switch property.subs
        case 'Notes'
            uitxt.Notes = newval;
        otherwise
            hgObj = uitxt.axischild;
            uitxt.axischild = subsasgn(hgObj, property, newval);
        end % switch
end
