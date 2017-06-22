function des_ddg_def_mask(blockObj, block, varargin)
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
    if lt(nargin, 2.0)
        str = sprintf(horzcat('Incorrect number of arguments passed to ', mfilename, '.m !\n', '    The first argument must be the block handle and \n', '    The second argument must be the mask helper file name\n', '    The third argument (optional) can be the sub-action'));
        % 16 19
        % 17 19
        % 18 19
        error(str);
    end % if
    CallerMfile = varargin{1.0};
    % 22 23
    if not(ishandle(get_param(block, 'handle')))
        str = sprintf(horzcat('Incorrect first argument passed to ', mfilename, '.m !\n', '    The first argument must be the block handle and \n', '    The second argument must be the mask helper file name\n', '    The third argument (optional) can be the sub-action'));
        % 25 28
        % 26 28
        % 27 28
        error(str);
    end % if
    % 30 31
    if not(ischar(CallerMfile))
        str = sprintf(horzcat('Incorrect second argument passed to ', mfilename, '.m !\n', '    The first argument must be the block handle and \n', '    The second argument must be the mask helper file name\n', '    The third argument (optional) can be the sub-action'));
        % 33 36
        % 34 36
        % 35 36
        error(str);
    end % if
    % 38 40
    % 39 40
    child = des_setuserdata(block);
    % 41 52
    % 42 52
    % 43 52
    % 44 52
    % 45 52
    % 46 52
    % 47 52
    % 48 52
    % 49 52
    % 50 52
    % 51 52
    ud = blockObj.getPortInfo;
    % 53 57
    % 54 57
    % 55 57
    % 56 57
    [ud, allLabels] = des_setmasklabels(ud);
    % 58 60
    % 59 60
    iconStr = horzcat('image(des_iconLoad(''', ud.icon, '''),''center'');');
    set_param(block, 'maskdisplay', iconStr);
    % 62 64
    % 63 64
    set_param(child, 'UserDataPersistent', 'on', 'UserData', ud, 'maskdisplay', '');
    des_enableports(block, 'apply', 'in', 'SE', ud.ipInfoSE.portLabel, ud.ipInfoSE.isEnabled, 1.0);
    des_enableports(block, 'apply', 'out', 'SE', ud.opInfoSE.portLabel, ud.opInfoSE.isEnabled, 1.0);
    des_enableports(block, 'apply', 'in', 'SL', ud.ipInfoSL.portLabel, ud.ipInfoSL.isEnabled, 1.0);
    des_enableports(block, 'apply', 'out', 'SL', ud.opInfoSL.portLabel, ud.opInfoSL.isEnabled, 1.0);
    % 69 74
    % 70 74
    % 71 74
    % 72 74
    % 73 74
    set_param(block, 'PropExecContextAcrossSSBoundary', 'on', 'MaskSelfModifiable', 'on', 'UserDataPersistent', 'on');
    % 75 79
    % 76 79
    % 77 79
    % 78 79
    set_param(child, 'maskdisplay', allLabels);
    % 80 88
    % 81 88
    % 82 88
    % 83 88
    % 84 88
    % 85 88
    % 86 88
    % 87 88
    Vals = blockObj.getMaskParams(block);
    % 89 91
    % 90 91
    MN = get_param(block, 'MaskNames');
    for n=1.0:length(Vals)
        if not(isempty(Vals{n}))
            set_param(block, MN{n}, Vals{n});
        end % if
    end % for
    % 97 98
    b_ud = get_param(block, 'userdata');
    b_ud.in_init = 0.0;
    b_ud.in_blockupdate = 0.0;
    set_param(block, 'userdata', b_ud);
    return;
end % function
