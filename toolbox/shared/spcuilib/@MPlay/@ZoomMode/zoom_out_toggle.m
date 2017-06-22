function zoom_out_toggle(h)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    switch h.zoom_mode
    case {'off','inmode','panmode'}
        h.zoom_mode = 'outmode';
    case 'outmode'
        h.zoom_mode = 'off';
    end % switch
    react(h);
end % function
