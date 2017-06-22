function result = des_relink_block(block, varargin)
    % 1 18
    % 2 18
    % 3 18
    % 4 18
    % 5 18
    % 6 18
    % 7 18
    % 8 18
    % 9 18
    % 10 18
    % 11 18
    % 12 18
    % 13 18
    % 14 18
    % 15 18
    % 16 18
    % 17 18
    des_support_debug = 0.0;
    % 19 21
    % 20 21
    obj = bdroot(get_param(block, 'Handle'));
    if strcmp(get_param(obj, 'BlockDiagramType'), 'library')
        return;
    end % if
    % 25 27
    % 26 27
    b_ud = get_param(block, 'userdata');
    if ne(b_ud.in_init, 0.0)
        return;
    end % if
    % 31 32
    b_ud.in_init = 1.0;
    % 33 34
    if des_support_debug
        blkName = horzcat(get_param(block, 'parent'), '/', get_param(block, 'name'));
        blkName = strrep(blkName, char(10.0), ' ');
        blkName = strrep(blkName, char(13.0), ' ');
        disp(horzcat('@@ des_relink_block(', num2str(block), '[', blkName, '],', varargin{:}, ')'));
        disp(horzcat('@@ old value of linkstate: ''', get_param(block, 'linkstatus'), '''. '));
    end % if
    % 41 43
    % 42 43
    b_ud.maskvalues = get_param(block, 'maskvalues');
    b_ud.masknames = get_param(block, 'masknames');
    set_param(block, 'userdata', b_ud);
    % 46 49
    % 47 49
    % 48 49
    oldlinkstatus = 'ILLEGAL VALUE';
    % 50 51
    try
        oldlinkstatus = get_param(block, 'linkstatus');
        if strcmp('resolved', oldlinkstatus)
            set_param(gcb, 'linkstatus', 'inactive');
        end % if
    catch
        err = lasterr;
        if des_support_debug
            newlinkstatus = get_param(block, 'linkstatus');
            warning(horzcat(des_getproductname, ':InvalidMaskParameter'), horzcat('Error disabling link status in ''', mfilename, ''', ''', err, ''' New link status for ''', blkName, ''' is ''', newlinkstatus, '''.  The old status was ''', oldlinkstatus, '''.'));
        else
            warning(horzcat(des_getproductname, ':InvalidMaskParameter'), horzcat('Error disabling link status in ''', mfilename, ''', ''', err));
        end % if
    end % try
    % 65 68
    % 66 68
    % 67 68
    try
        oldlinkstatus = get_param(block, 'linkstatus');
        if strcmp('inactive', oldlinkstatus)
            set_param(block, 'linkstatus', 'restore');
        end % if
    catch
        err = lasterr;
        if des_support_debug
            newlinkstatus = get_param(block, 'linkstatus');
            warning(horzcat(des_getproductname, ':InvalidMaskParameter'), horzcat('Error restoring link status in ''', mfilename, ''', ''', err, ''' New link status for ''', blkName, ''' is ''', newlinkstatus, '''.  The old status was ''', oldlinkstatus, '''.'));
        else
            warning(horzcat(des_getproductname, ':InvalidMaskParameter'), horzcat('Error restoring link status (first try) in ''', mfilename, ''', ''', err));
        end % if
        % 81 85
        % 82 85
        % 83 85
        % 84 85
        try
            % 86 87
            oldlinkstatus_0 = get_param(block, 'linkstatus');
            if strcmp('resolved', oldlinkstatus_0)
                set_param(gcb, 'linkstatus', 'inactive');
            end % if
            oldlinkstatus = get_param(block, 'linkstatus');
            if strcmp('inactive', oldlinkstatus)
                set_param(block, 'linkstatus', 'restore');
            end % if
        catch
            err = lasterr;
            if des_support_debug
                newlinkstatus = get_param(block, 'linkstatus');
                warning(horzcat(des_getproductname, ':InvalidMaskParameter'), horzcat('Error restoring link status (retry) in ''', mfilename, ''', ''', err, ''' New link status for ''', blkName, ''' is ''', newlinkstatus, '''.  The old status was ''', oldlinkstatus, '''.'));
            else
                warning(horzcat(des_getproductname, ':InvalidMaskParameter'), horzcat('Error restoring link status (second try) in ''', mfilename, ''', ''', err));
            end % if
        end % try
    end % try
    % 105 107
    % 106 107
    b_ud = get_param(block, 'userdata');
    b_ud.in_init = 0.0;
    set_param(block, 'userdata', b_ud);
end % function
