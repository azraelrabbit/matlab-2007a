%  function A = subsasgn(A, S, B)
%      % 1 8
%      % 2 8
%      % 3 8
%      % 4 8
%      % 5 8
%      % 6 8
%      % 7 8
%      switch S.type
%      otherwise
% MATASS1 39 v% 0 [] []
% SWITCHCMP  46 SWITCHCMP ('matnum=8', '("v%")') {'matnum': '8'}
%      case '.'
% IF0 SWITCH 48 ('skip=242', '(to', '292)') {'skip': '242'}
%          switch lower(S.subs)
%          otherwise
% MATASS1 74 v% 1 [] []
% SWITCHCMP  81 SWITCHCMP ('matnum=9', '("v%")') {'matnum': '9'}
%          case 'notes'
% IF0 SWITCH 83 ('skip=22', '(to', '107)') {'skip': '22'}
%              A.Notes = B;
% JUMP skip to  290
%          otherwise
% SWITCHCMP  112 SWITCHCMP ('matnum=9', '("v%")') {'matnum': '9'}
%          case 'date'
% IF0 SWITCH 114 ('skip=22', '(to', '138)') {'skip': '22'}
%              A.Date = B;
% JUMP skip to  290
%          otherwise
% SWITCHCMP  143 SWITCHCMP ('matnum=9', '("v%")') {'matnum': '9'}
%          case 'origin'
% IF0 SWITCH 145 ('skip=22', '(to', '169)') {'skip': '22'}
%              A.Origin = B;
% JUMP skip to  290
%          otherwise
% SWITCHCMP  174 SWITCHCMP ('matnum=9', '("v%")') {'matnum': '9'}
%          case 'savedposition'
% IF0 SWITCH 176 ('skip=24', '(to', '202)') {'skip': '24'}
%              A.SavedPosition = B;
% JUMP skip to  290
%          otherwise
% SWITCHCMP  207 SWITCHCMP ('matnum=9', '("v%")') {'matnum': '9'}
%          case 'dragobjects'
% IF0 SWITCH 209 ('skip=23', '(to', '234)') {'skip': '23'}
%              A.DragObjects = B;
% JUMP skip to  290
%          otherwise
% MATASS1 254 hgObj 0 [] ['A.scribehgobj']
%              hgObj = A.scribehgobj;
%              A.scribehgobj = subsasgn(hgObj, S, B);
%          end % switch
%  end
function A = subsasgn(A, S, B)
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
        case 'notes'
            A.Notes = B;
        case 'date'
            A.Date = B;
        case 'origin'
            A.Origin = B;
        case 'savedposition'
            A.SavedPosition = B;
        case 'dragobjects'
            A.DragObjects = B;
        otherwise
            hgObj = A.scribehgobj;
            A.scribehgobj = subsasgn(hgObj, S, B);
        end % switch
end
