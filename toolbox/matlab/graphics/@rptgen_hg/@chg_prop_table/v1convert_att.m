%  function att = v1convert_att(this, att, varargin)
%      % 1 7
%      % 2 7
%      % 3 7
%      % 4 7
%      % 5 7
%      % 6 7
% stack: ['att', ':'] 1
%  MATREFNDCX ('nindices=-2',) {'nindices': '-2'}
% MATASS1 52 att 0 [] ['this.v1convert_table(att, varargin{:})']
%      att = this.v1convert_table(att, varargin{:});
%      % 8 9
% stack: ['1.0'] 1
%      switch varargin{1.0}
%      otherwise
% MATASS1 69 v% 0 [] []
% SWITCHCMP  76 SWITCHCMP ('matnum=7', '("v%")') {'matnum': '7'}
%      case 'chgfigproptable'
% IF0 SWITCH 78 ('skip=22', '(to', '102)') {'skip': '22'}
%          att.ObjectType = 'Figure';
%  end
function att = v1convert_att(this, att, varargin)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    att = this.v1convert_table(att, varargin{:});
    % 8 9
    switch varargin{1.0}
    case 'chgfigproptable'
        att.ObjectType = 'Figure';
end
