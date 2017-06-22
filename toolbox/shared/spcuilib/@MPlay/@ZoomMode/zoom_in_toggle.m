function zoom_in_toggle(h)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    switch h.zoom_mode
    case {'off','outmode','panmode'}
        h.zoom_mode = 'inmode';
    case 'inmode'
        h.zoom_mode = 'off';
    end % switch
    react(h);
end % function
