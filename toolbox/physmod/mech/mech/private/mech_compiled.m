%  function compiled = mech_compiled(obj)
%      % 1 9
%      % 2 9
%      % 3 9
%      % 4 9
%      % 5 9
%      % 6 9
%      % 7 9
%      % 8 9
% MATASS1 33 bd 1 [] ['bdroot(obj)']
%      bd = bdroot(obj);
% MATASS1 45 compiled 1 [] ['false']
%      compiled = false;
% MATASS1 62 status 1 [] ["get_param(bd, 'SimulationStatus')"]
%      status = get_param(bd, 'SimulationStatus');
%      switch status
%      otherwise
% MATASS1 74 v% 0 [] []
% MXMARSHALCONST skip ('index=', '5', 'size(ints)', '=')
% MXMARSHALCONST data ('64', '1296630016,', '0,', '14,', '240,', '6,', '8,', '1,', '0,', '5,', '8,', '1,', '3,', '1,', '0,', '14,', '56,', '6,', '8,', '4,', '0,', '5,', '8,', '1,', '7,', '1,', '0,', '16,', '7,', '1852732786,', '6778473,', '14,', '56,', '6,', '8,', '4,', '0,', '5,', '8,', '1,', '6,', '1,', '0,', '16,', '6,', '1937072496,', '25701,', '14,', '64,', '6,', '8,', '4,', '0,', '5,', '8,', '1,', '11,', '1,', '0,', '16,', '11,', '1836213620,', '1952542313,', '6778473,', '0')
% MXMARSHALCONST parsed {'running','paused','terminating'}
% SWITCHCMP  81 SWITCHCMP ('matnum=8', '("v%")') {'matnum': '8'}
%      case {'running','paused','terminating'}
% IF0 SWITCH 83 ('skip=14', '(to', '99)') {'skip': '14'}
% MATASS1 95 compiled 1 [] ['true']
%          compiled = true;
%  end
function compiled = mech_compiled(obj)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    bd = bdroot(obj);
    compiled = false;
    status = get_param(bd, 'SimulationStatus');
    switch status
    case {'running','paused','terminating'}
        compiled = true;
end
