function [tmf, envVal] = modelrefsim_default_tmf
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    [tmf, envVal] = get_tmf_for_target('modelrefsim');
    switch computer
    case 'PCWIN'
        if not(strcmp(tmf, 'modelrefsim_vc.tmf')) && not(strcmp(tmf, 'modelrefsim_lcc.tmf'))
            warning('Switching to modelrefsim_lcc.tmf for model reference simulation target.');
            tmf = 'modelrefsim_lcc.tmf';
            envVal = '';
        end % if
    otherwise
        % 18 20
    end % switch
