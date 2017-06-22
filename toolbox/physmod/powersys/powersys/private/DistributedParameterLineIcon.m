function DistributedParameterLineIcon(block)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    nphase = eval(get_param(block, 'Phases'));
    ports = get_param(block, 'ports');
    if eq(nphase, 1.0)
        set_param(block, 'MaskIconFrame', 'off')
        PlotIcon = 'plot([0 20 20 80 80 100 80 80 20 20],[0 0 5 5 0 0 0 -5 -5 0]+20,0,0,100,40)';
    end % if
    % 14 15
    if eq(nphase, 2.0)
        set_param(block, 'MaskIconFrame', 'off')
        PlotIcon = 'plot([0 20 20 80 80 100 80 80 20 20],[0 0 5 5 0 0 0 -5 -5 0]+90,[0 20 20 80 80 100 80 80 20 20],[0 0 5 5 0 0 0 -5 -5 0]+30,0,0,100,120)';
    end % if
    % 19 20
    if eq(nphase, 3.0)
        set_param(block, 'MaskIconFrame', 'off')
        PlotIcon = 'plot([0 20 20 80 80 100 80 80 20 20],[0 0 5 5 0 0 0 -5 -5 0]+100,[0 20 20 80 80 100 80 80 20 20],[0 0 5 5 0 0 0 -5 -5 0]+60,[0 20 20 80 80 100 80 80 20 20],[0 0 5 5 0 0 0 -5 -5 0]+20,0,0,100,120)';
    end % if
    if gt(nphase, 3.0)
        set_param(block, 'MaskIconFrame', 'on')
        PlotIcon = 'plot([0 20 20 80 80 100 80 80 20 20],([0 0 5 5 0 0 0 -5 -5 0]+50),-10,0,110,100)';
    end % if
    set_param(block, 'Maskdisplay', PlotIcon);
end % function
