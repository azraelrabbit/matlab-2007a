function errMsg = config_fcnproto_ss_build(block_hdl, mdl_hdl, action)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    persistent USERDATA;
    % 7 9
    errMsg = '';
    % 9 11
    switch action
    case 'Create'
        % 12 15
        % 13 15
        try
            block_hdl = get_param(block_hdl, 'Handle');
        catch
            errMsg = DAStudio.message('RTW:fcnClass:invalidBlock', block_hdl);
            return
        end % try
        % 20 22
        block_name = getfullname(block_hdl);
        % 22 24
        try
            if eq(strcmpi(get_param(block_hdl, 'Type'), 'Block'), 0.0)
                errMsg = DAStudio.message('RTW:fcnClass:invalidBlock', block_name);
                return
            end
        catch
            errMsg = DAStudio.message('RTW:fcnClass:invalidBlock', block_name);
            return
        end % try
        % 32 34
        try
            if eq(strcmpi(get_param(block_hdl, 'BlockType'), 'SubSystem'), 0.0)
                errMsg = DAStudio.message('RTW:fcnClass:invalidBlock', block_name);
                return
            end
        catch
            errMsg = DAStudio.message('RTW:fcnClass:invalidBlock', block_name);
            return
        end % try
        % 42 44
        udata = LocalRetrieveThisUserData(USERDATA, block_hdl, 'BLK_HDL');
        if not(isempty(udata))
            entry = udata(1.0);
            hDlg = entry.HDLG;
            hDlg.show();
            return
        end
        % 50 54
        % 51 54
        % 52 54
        isAtomic = get_param(block_hdl, 'TreatAsAtomicUnit');
        % 54 56
        if not(strcmp(isAtomic, 'on'))
            errMsg = DAStudio.message('RTW:fcnClass:notAtomicSubsys', block_name);
            return
        end
        % 59 62
        % 60 62
        topMdl = bdroot(block_hdl);
        % 62 64
        cs = getActiveConfigSet(topMdl);
        % 64 66
        isERT = strcmp(get_param(cs, 'IsERTTarget'), 'on');
        % 66 68
        if not(isERT)
            errMsg = DAStudio.message('RTW:fcnClass:nonERT');
            return
        end
        % 71 73
        isMdlStepFcnProtoCompliant = get_param(cs, 'ModelStepFunctionPrototypeControlCompliant');
        flag = strcmp(isMdlStepFcnProtoCompliant, 'on');
        if not(flag)
            errMsg = DAStudio.message('RTW:fcnClass:nonMdlStepFcnProtoCompliant');
            return
        end
        % 78 80
        slsfnagctlr('Clear', getfullname(topMdl), 'RTW.configSubsystemBuild');
        % 80 82
        try
            [tempMdl, ports, error_occ] = ss2mdl(block_hdl, 0.0);
        catch
            slsfnagctlr('ViewNaglog');
            return
        end % try
        % 87 89
        if error_occ
            slsfnagctlr('ViewNaglog');
            return
        end
        % 92 94
        fcnclass = get_param(block_hdl, 'SSRTWFcnClass');
        if isempty(fcnclass)
            fcnclass = RTW.FcnDefault('', tempMdl);
        else
            fcnclass.ModelHandle = tempMdl;
        end
        fcnclass.RightClickBuild = true;
        fcnclass.SubsysBlockHdl = block_hdl;
        fcnclassUI = RTW.FcnCtlUI(fcnclass);
        hDlg = DAStudio.Dialog(fcnclassUI);
        USERDATA = LocalUpdateUserData(USERDATA, tempMdl, topMdl, block_hdl, hDlg);
        sys = get_param(topMdl, 'object');
        LocalCheckCloseListener(sys, fcnclassUI);
        % 107 109
    case 'Close'
        % 108 110
        ind = 0.0;
        for i=1.0:length(USERDATA)
            thisdata = USERDATA(i);
            if eq(thisdata.BLK_HDL, block_hdl)
                ind = i;
                close_system(thisdata.TMP_MDL, 0.0);
                break
            end
        end % for
        USERDATA = horzcat(USERDATA(1.0:minus(ind, 1.0)), USERDATA(plus(ind, 1.0):end));
    case 'ModelClose'
        % 120 123
        % 121 123
        udata = [];
        toDelete = [];
        for i=1.0:length(USERDATA)
            thisdata = USERDATA(i);
            if ne(thisdata.BLK_MDL, mdl_hdl)
                udata = horzcat(udata, thisdata);
            else
                errSaved = lasterror;
                slErrSaved = sllasterror;
                try
                    close_system(thisdata.TMP_MDL, 0.0);
                catch
                    % 134 137
                    % 135 137
                    lasterror(errSaved);
                    sllasterror(slErrSaved);
                end % try
                toDelete = horzcat(toDelete, thisdata.HDLG);
            end
        end % for
        USERDATA = udata;
        for i=1.0:length(toDelete)
            toDelete(i).delete();
        end % for
    otherwise
        % 147 149
        error('Unkonwn case encountered.');
    end
end
function userdata = LocalUpdateUserData(userdata, temp_model, blk_model, blk_hdl, hDlg)
    % 152 156
    % 153 156
    % 154 156
    newdata.TMP_MDL = temp_model;
    newdata.BLK_MDL = blk_model;
    newdata.BLK_HDL = blk_hdl;
    newdata.HDLG = hDlg;
    % 159 161
    if isempty(userdata)
        userdata = newdata;
    else
        userdata(plus(end, 1.0)) = newdata;
    end
end
function udata = LocalRetrieveThisUserData(userdata, hdl, fieldname)
    % 167 172
    % 168 172
    % 169 172
    % 170 172
    udata = [];
    for i=1.0:length(userdata)
        data = userdata(i);
        h = eval(horzcat('data.', fieldname));
        if eq(h, hdl)
            udata = horzcat(udata, userdata(i));
            break
        end
    end % for
end
function LocalCheckCloseListener(theSys, uddUI)
    % 182 185
    % 183 185
    listnerObj = handle.listener(theSys, 'CloseEvent', @LocalCloseCB);
    uddUI.closeListener = listnerObj;
end
function LocalCloseCB(eventSrc, eventData)
    % 188 190
    cs = eventSrc.getActiveConfigSet();
    hMdl = cs.getModel();
    config_fcnproto_ss_build(-1.0, hMdl, 'ModelClose');
end
