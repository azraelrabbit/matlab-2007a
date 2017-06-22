%  function scales = quantizescalevalues(filterobj)
%      % 1 12
%      % 2 12
%      % 3 12
%      % 4 12
%      % 5 12
%      % 6 12
%      % 7 12
%      % 8 12
%      % 9 12
%      % 10 12
%      % 11 12
% DYNAMICREF issos 1 1 ['filterobj']
% IF0 37 ('skip=25', '(to', '64)') {'skip': '25'} not(issos(filterobj))
%      if not(issos(filterobj))
%          error(generatemsgid('nonsos'), 'quantizescalevalues called with non SOS IIR filter object %s', filterobj);
%          % 14 16
%          % 15 16
%      end % if
%      switch lower(class(filterobj))
%      otherwise
% MATASS1 85 v% 1 [] []
% MXMARSHALCONST skip ('index=', '6', 'size(ints)', '=')
% MXMARSHALCONST data ('86', '1296630016,', '0,', '14,', '328,', '6,', '8,', '1,', '0,', '5,', '8,', '1,', '4,', '1,', '0,', '14,', '64,', '6,', '8,', '4,', '0,', '5,', '8,', '1,', '12,', '1,', '0,', '16,', '12,', '1818846820,', '1717841524,', '1936683825,', '0,', '14,', '64,', '6,', '8,', '4,', '0,', '5,', '8,', '1,', '13,', '1,', '0,', '16,', '13,', '1818846820,', '1717841524,', '1869837361,', '115,', '14,', '64,', '6,', '8,', '4,', '0,', '5,', '8,', '1,', '12,', '1,', '0,', '16,', '12,', '1818846820,', '1717841524,', '1936683826,', '0,', '14,', '64,', '6,', '8,', '4,', '0,', '5,', '8,', '1,', '13,', '1,', '0,', '16,', '13,', '1818846820,', '1717841524,', '1869837362,', '115')
% MXMARSHALCONST parsed {'dfilt.df1sos','dfilt.df1tsos','dfilt.df2sos','dfilt.df2tsos'}
% SWITCHCMP  92 SWITCHCMP ('matnum=7', '("v%")') {'matnum': '7'}
%      case {'dfilt.df1sos','dfilt.df1tsos','dfilt.df2sos','dfilt.df2tsos'}
% IF0 SWITCH 94 ('skip=22', '(to', '118)') {'skip': '22'}
% MATASS1 114 scales 1 [] ['filterobj.ScaleValues']
%          scales = filterobj.ScaleValues;
%  end
function scales = quantizescalevalues(filterobj)
    % 1 12
    % 2 12
    % 3 12
    % 4 12
    % 5 12
    % 6 12
    % 7 12
    % 8 12
    % 9 12
    % 10 12
    % 11 12
    if not(issos(filterobj))
        error(generatemsgid('nonsos'), 'quantizescalevalues called with non SOS IIR filter object %s', filterobj);
        % 14 16
        % 15 16
    end % if
    switch lower(class(filterobj))
    case {'dfilt.df1sos','dfilt.df1tsos','dfilt.df2sos','dfilt.df2tsos'}
        scales = filterobj.ScaleValues;
end
