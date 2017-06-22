function des_reinit_mask(block, b_ud)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    des_support_debug = 0.0;
    % 10 13
    % 11 13
    % 12 13
    if not(isfield(b_ud, 'masknames'))
        % 14 15
        b_ud1 = get_param(block, 'userdata');
        b_ud1.in_init = 0.0;
        set_param(block, 'userdata', b_ud1);
        % 18 20
        % 19 20
        return;
    end % if
    % 22 24
    % 23 24
    blk_maskvalues = get_param(block, 'maskvalues');
    blk_masknames = get_param(block, 'masknames');
    % 26 29
    % 27 29
    % 28 29
    if b_ud.in_init
        % 30 31
        for idx=1.0:length(b_ud.masknames)
            try
                if des_support_debug
                    disp(horzcat('@@ ', block, ': setting ', b_ud.masknames{idx}, ' to ', b_ud.maskvalues{idx}));
                end % if
                % 36 39
                % 37 39
                % 38 39
                m_idx = strmatch(b_ud.masknames{idx}, blk_masknames, 'exact');
                if des_support_debug
                    if gt(length(m_idx), 1.0)
                        disp(horzcat('@@ Found more than one matching mask paramter in mask dialog for ', block, '.'));
                    end % if
                end % if
                if lt(length(m_idx), 1.0)
                    if des_support_debug
                        disp(horzcat('@@ Found NO matching mask paramter in mask dialog for ', block, '.'));
                    end % if
                    % 49 50
                    continue;
                end % if
                if des_support_debug
                    disp(horzcat('@@ ', block, ': setting ', blk_masknames{m_idx}, ' to ', b_ud.maskvalues{idx}));
                end % if
                % 55 57
                % 56 57
                set_param(block, blk_masknames{m_idx}, b_ud.maskvalues{idx});
            catch
                % 59 60
                if des_support_debug
                    disp(horzcat('@@ ', block, ':failure while setting ', b_ud.masknames{idx}, ' to ', b_ud.maskvalues{idx}));
                else
                    warning(horzcat(des_getproductname, ':MissingMaskParameter'), horzcat('failure while setting ', b_ud.masknames{idx}, ' to ', b_ud.maskvalues{idx}));
                    % 64 65
                end % if
            end % try
        end % for
    end % if
    % 69 70
    return;
end % function
