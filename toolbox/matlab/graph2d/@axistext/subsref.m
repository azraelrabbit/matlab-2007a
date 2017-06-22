%  function B = subsref(uitxt, property)
%      % 1 8
%      % 2 8
%      % 3 8
%      % 4 8
%      % 5 8
%      % 6 8
%      % 7 8
%      switch property.type
%      otherwise
% MATASS1 41 v% 0 [] []
% SWITCHCMP  48 SWITCHCMP ('matnum=8', '("v%")') {'matnum': '8'}
%      case '.'
% IF0 SWITCH 50 ('skip=93', '(to', '145)') {'skip': '93'}
%          switch property.subs
%          otherwise
% MATASS1 69 v% 0 [] []
% SWITCHCMP  76 SWITCHCMP ('matnum=9', '("v%")') {'matnum': '9'}
%          case 'Notes'
% IF0 SWITCH 78 ('skip=21', '(to', '101)') {'skip': '21'}
% MATASS1 97 B 0 [] ['uitxt.Notes']
%              B = uitxt.Notes;
% JUMP skip to  143
%          otherwise
% MATASS1 121 hgObj 0 [] ['uitxt.axischild']
%              hgObj = uitxt.axischild;
% MATASS1 139 B 1 [] ['subsref(hgObj, property)']
%              B = subsref(hgObj, property);
%          end % switch
%  end
function B = subsref(uitxt, property)
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
            B = uitxt.Notes;
        otherwise
            hgObj = uitxt.axischild;
            B = subsref(hgObj, property);
        end % switch
end
