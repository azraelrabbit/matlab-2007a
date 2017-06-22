%  function B = subsref(A, S)
%      % 1 8
%      % 2 8
%      % 3 8
%      % 4 8
%      % 5 8
%      % 6 8
%      % 7 8
%      switch S.type
%      otherwise
% MATASS1 38 v% 0 [] []
% SWITCHCMP  45 SWITCHCMP ('matnum=8', '("v%")') {'matnum': '8'}
%      case '.'
% IF0 SWITCH 47 ('skip=279', '(to', '328)') {'skip': '279'}
%          switch lower(S.subs)
%          otherwise
% MATASS1 73 v% 1 [] []
% SWITCHCMP  80 SWITCHCMP ('matnum=9', '("v%")') {'matnum': '9'}
%          case 'hghandle'
% IF0 SWITCH 82 ('skip=19', '(to', '103)') {'skip': '19'}
% MATASS1 99 B 1 [] ["get(A, 'HGHandle')"]
%              B = get(A, 'HGHandle');
% JUMP skip to  326
%          otherwise
% SWITCHCMP  108 SWITCHCMP ('matnum=9', '("v%")') {'matnum': '9'}
%          case 'myhghandle'
% IF0 SWITCH 110 ('skip=19', '(to', '131)') {'skip': '19'}
% MATASS1 127 B 1 [] ["get(A, 'MyHGHandle')"]
%              B = get(A, 'MyHGHandle');
% JUMP skip to  326
%          otherwise
% SWITCHCMP  136 SWITCHCMP ('matnum=9', '("v%")') {'matnum': '9'}
%          case 'notes'
% IF0 SWITCH 138 ('skip=21', '(to', '161)') {'skip': '21'}
% MATASS1 157 B 0 [] ['A.Notes']
%              B = A.Notes;
% JUMP skip to  326
%          otherwise
% SWITCHCMP  166 SWITCHCMP ('matnum=9', '("v%")') {'matnum': '9'}
%          case 'date'
% IF0 SWITCH 168 ('skip=21', '(to', '191)') {'skip': '21'}
% MATASS1 187 B 0 [] ['A.Date']
%              B = A.Date;
% JUMP skip to  326
%          otherwise
% SWITCHCMP  196 SWITCHCMP ('matnum=9', '("v%")') {'matnum': '9'}
%          case 'origin'
% IF0 SWITCH 198 ('skip=21', '(to', '221)') {'skip': '21'}
% MATASS1 217 B 0 [] ['A.Origin']
%              B = A.Origin;
% JUMP skip to  326
%          otherwise
% SWITCHCMP  226 SWITCHCMP ('matnum=9', '("v%")') {'matnum': '9'}
%          case 'savedposition'
% IF0 SWITCH 228 ('skip=23', '(to', '253)') {'skip': '23'}
% MATASS1 249 B 0 [] ['A.SavedPosition']
%              B = A.SavedPosition;
% JUMP skip to  326
%          otherwise
% SWITCHCMP  258 SWITCHCMP ('matnum=9', '("v%")') {'matnum': '9'}
%          case 'dragobjects'
% IF0 SWITCH 260 ('skip=22', '(to', '284)') {'skip': '22'}
% MATASS1 280 B 0 [] ['A.DragObjects']
%              B = A.DragObjects;
% JUMP skip to  326
%          otherwise
% MATASS1 304 hgObj 0 [] ['A.scribehgobj']
%              hgObj = A.scribehgobj;
% MATASS1 322 B 1 [] ['subsref(hgObj, S)']
%              B = subsref(hgObj, S);
%          end % switch
%  end
function B = subsref(A, S)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    switch S.type
    case '.'
        switch lower(S.subs)
        case 'hghandle'
            B = get(A, 'HGHandle');
        case 'myhghandle'
            B = get(A, 'MyHGHandle');
        case 'notes'
            B = A.Notes;
        case 'date'
            B = A.Date;
        case 'origin'
            B = A.Origin;
        case 'savedposition'
            B = A.SavedPosition;
        case 'dragobjects'
            B = A.DragObjects;
        otherwise
            hgObj = A.scribehgobj;
            B = subsref(hgObj, S);
        end % switch
end
