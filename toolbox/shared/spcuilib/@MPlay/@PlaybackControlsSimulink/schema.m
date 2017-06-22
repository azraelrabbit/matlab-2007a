function schema
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    pkg = findpackage('MPlay');
    base = findclass(pkg, 'PlaybackControls');
    this = schema.class(pkg, 'PlaybackControlsSimulink', base);
    % 10 13
    % 11 13
    % 12 13
    schema.prop(this, 'button_simulink_stop', 'MATLAB array');
    schema.prop(this, 'button_simulink_play', 'MATLAB array');
    schema.prop(this, 'button_simulink_step_fwd', 'MATLAB array');
    % 16 17
    schema.prop(this, 'button_simulink_snapshot', 'MATLAB array');
    schema.prop(this, 'button_simulink_hilite', 'MATLAB array');
    schema.prop(this, 'button_simulink_floating', 'MATLAB array');
    % 20 23
    % 21 23
    % 22 23
    schema.prop(this, 'menu_simulink_stop', 'MATLAB array');
    schema.prop(this, 'menu_simulink_play', 'MATLAB array');
    schema.prop(this, 'menu_simulink_step_fwd', 'MATLAB array');
    % 26 27
    schema.prop(this, 'menu_simulink_snapshot', 'MATLAB array');
    schema.prop(this, 'menu_simulink_hilite', 'MATLAB array');
    schema.prop(this, 'menu_simulink_floating', 'MATLAB array');
    % 30 36
    % 31 36
    % 32 36
    % 33 36
    % 34 36
    % 35 36
    p = schema.prop(this, 'framecnt', 'MATLAB array');
    p.FactoryValue = uint32(0.0);
    % 38 43
    % 39 43
    % 40 43
    % 41 43
    % 42 43
    p = schema.prop(this, 'TimeOfDisplayData', 'double');
    p.FactoryValue = -1.0;
    % 45 49
    % 46 49
    % 47 49
    % 48 49
    p = schema.prop(this, 'PendingSimTimeReadout', 'bool');
    p.FactoryValue = false;
end % function
