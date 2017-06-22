function AvmInverterCbak(block)
    % 1 14
    % 2 14
    % 3 14
    % 4 14
    % 5 14
    % 6 14
    % 7 14
    % 8 14
    % 9 14
    % 10 14
    % 11 14
    % 12 14
    % 13 14
    try
        find_system(horzcat(block, '/Universal Bridge'));
    catch
        m{1.0} = 'Unable to find the Universal Bridge block';
        m{2.0} = 'Please contact help support.';
        msgbox(m, 'Detailed inverter', 'error')
        return;
    end % try
    % 22 24
    % 23 24
    arms = get_param(block, 'Arms');
    set_param(horzcat(block, '/Universal Bridge'), 'Arms', arms)
    % 26 28
    % 27 28
    device = get_param(block, 'Device');
    set_param(horzcat(block, '/Universal Bridge'), 'Device', device)
    % 30 32
    % 31 32
    measurements = get_param(block, 'Measurements');
    set_param(horzcat(block, '/Universal Bridge'), 'Measurements', measurements)
    % 34 36
    % 35 36
    set_param(block, 'Maskdisplay', get_param(horzcat(block, '/Universal Bridge'), 'Maskdisplay'))
    % 37 39
    % 38 39
    mv = get_param(horzcat(block, '/Universal Bridge'), 'Maskvisibilities');
    mv_old = get_param(block, 'Maskvisibilities');
    mv_new = mv_old;
    mv_new(1.0:length(mv)) = mv;
    set_param(block, 'Maskvisibilities', mv_new)
end % function
