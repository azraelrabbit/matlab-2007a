%  function disabled = vector_config_params(configblock)
%      % 1 15
%      % 2 15
%      % 3 15
%      % 4 15
%      % 5 15
%      % 6 15
%      % 7 15
%      % 8 15
%      % 9 15
%      % 10 15
%      % 11 15
%      % 12 15
%      % 13 15
%      % 14 15
% MATASS1 37 channel_param 1 [] ["get_param(configblock, 'channel_param')"]
%      channel_param = get_param(configblock, 'channel_param');
%      % 16 20
%      % 17 20
%      % 18 20
%      % 19 20
% MATASS1 46 disabled 0 [] ['0.0']
%      disabled = 0.0;
%      % 21 22
%      switch channel_param
%      otherwise
% MATASS1 58 v% 0 [] []
% SWITCHCMP  65 SWITCHCMP ('matnum=7', '("v%")') {'matnum': '7'}
%      case 'None'
% IF0 SWITCH 67 ('skip=11', '(to', '80)') {'skip': '11'}
% MATASS1 76 disabled 0 [] ['1.0']
%          disabled = 1.0;
%  end
function disabled = vector_config_params(configblock)
    % 1 15
    % 2 15
    % 3 15
    % 4 15
    % 5 15
    % 6 15
    % 7 15
    % 8 15
    % 9 15
    % 10 15
    % 11 15
    % 12 15
    % 13 15
    % 14 15
    channel_param = get_param(configblock, 'channel_param');
    % 16 20
    % 17 20
    % 18 20
    % 19 20
    disabled = 0.0;
    % 21 22
    switch channel_param
    case 'None'
        disabled = 1.0;
end
