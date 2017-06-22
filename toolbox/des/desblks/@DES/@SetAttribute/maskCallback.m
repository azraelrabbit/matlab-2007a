function MaskWSData = maskCallback(hDlgSrcObj, block, action)
    % 1 5
    % 2 5
    % 3 5
    subaction = 'apply';
    % 5 9
    % 6 9
    % 7 9
    switch action
    case 'init'
        % 10 20
        % 11 20
        % 12 20
        % 13 20
        % 14 20
        % 15 20
        % 16 20
        % 17 20
        % 18 20
        b_ud = get_param(block, 'userdata');
        % 20 22
        if b_ud.in_blockupdate
            return;
        end % if
        % 24 30
        % 25 30
        % 26 30
        % 27 30
        % 28 30
        des_cbStats(block, 'statNumberDeparted', '#d', subaction);
        rowSrcObjArray = hDlgSrcObj.TableRowSrcObj;
        newPorts = [];
        % 32 34
        for idx=1.0:numel(rowSrcObjArray)
            AttributeFrom = rowSrcObjArray(idx).SrcAttributeFrom;
            if strcmp(AttributeFrom, 'Signal port')
                newPorts = horzcat(newPorts, idx);
            end % if
        end % for
        des_enablesignalport(block, subaction, 'in', 'SL', 'A', newPorts, 'dimsInfo', '-1');
    case 'default'
        % 41 43
        hDlgSrcObj.des_ddg_def_mask(block, mfilename);
        des_cbStats(block, 'statNumberDeparted', '#d', subaction);
    end % switch
