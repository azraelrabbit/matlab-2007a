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
% IF0 SWITCH 48 ('skip=139', '(to', '189)') {'skip': '139'}
%          switch S.subs
%          otherwise
% MATASS1 67 v% 0 [] []
% SWITCHCMP  74 SWITCHCMP ('matnum=9', '("v%")') {'matnum': '9'}
%          case 'FigObj'
% IF0 SWITCH 76 ('skip=22', '(to', '100)') {'skip': '22'}
%              A.FigObj = B;
% JUMP skip to  187
%          otherwise
% SWITCHCMP  105 SWITCHCMP ('matnum=9', '("v%")') {'matnum': '9'}
%          case 'Notes'
% IF0 SWITCH 107 ('skip=22', '(to', '131)') {'skip': '22'}
%              A.Notes = B;
% JUMP skip to  187
%          otherwise
% MATASS1 151 HGObj 0 [] ['A.scribehgobj']
%              HGObj = A.scribehgobj;
%              A.scribehgobj = subsasgn(HGObj, S, B);
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
        switch S.subs
        case 'FigObj'
            A.FigObj = B;
        case 'Notes'
            A.Notes = B;
        otherwise
            HGObj = A.scribehgobj;
            A.scribehgobj = subsasgn(HGObj, S, B);
        end % switch
end
