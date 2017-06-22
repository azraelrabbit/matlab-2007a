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
% IF0 SWITCH 47 ('skip=123', '(to', '172)') {'skip': '123'}
%          switch S.subs
%          otherwise
% MATASS1 66 v% 0 [] []
% SWITCHCMP  73 SWITCHCMP ('matnum=9', '("v%")') {'matnum': '9'}
%          case 'FigObj'
% IF0 SWITCH 75 ('skip=21', '(to', '98)') {'skip': '21'}
% MATASS1 94 B 0 [] ['A.FigObj']
%              B = A.FigObj;
% JUMP skip to  170
%          otherwise
% SWITCHCMP  103 SWITCHCMP ('matnum=9', '("v%")') {'matnum': '9'}
%          case 'Notes'
% IF0 SWITCH 105 ('skip=21', '(to', '128)') {'skip': '21'}
% MATASS1 124 B 0 [] ['A.Notes']
%              B = A.Notes;
% JUMP skip to  170
%          otherwise
% MATASS1 148 HGObj 0 [] ['A.scribehgobj']
%              HGObj = A.scribehgobj;
% MATASS1 166 B 1 [] ['subsref(HGObj, S)']
%              B = subsref(HGObj, S);
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
        switch S.subs
        case 'FigObj'
            B = A.FigObj;
        case 'Notes'
            B = A.Notes;
        otherwise
            HGObj = A.scribehgobj;
            B = subsref(HGObj, S);
        end % switch
end
