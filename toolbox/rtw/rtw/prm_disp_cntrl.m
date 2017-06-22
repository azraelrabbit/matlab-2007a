function prm_disp_cntrl(block)
    % 1 3
    % 2 3
    prm_to_disp = plus(str2num(strrep(get_param(block, 'prm_to_disp'), '.', ' ')), 3.0);
    % 4 5
    mask_visibilities = get_param(block, 'MaskVisibilities');
    mask_visibilities(4.0:end) = {'off'};
    mask_visibilities(prm_to_disp(1.0):prm_to_disp(2.0)) = {'on'};
    set_param(block, 'MaskVisibilities', mask_visibilities);
end % function
