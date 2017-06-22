function [valid, errmsg] = validateChanges(h, hdlg)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    % 9 10
    MaskParamCheck{1.0} = struct('Numeric', {'Period','PriorityEntityGeneration','Minimum','Maximum','Mean','InitialSeed'}, 'isValid', {'IsReal','IsInt','IsReal','IsReal','IsReal','IsInt'}, 'inRange', {[0.0,inf],[1.0,inf],[0.0,inf],[0.0,inf],[0.0,inf],[0.0,inf]}, 'rangeOpt', {'openlower','closeboth','openupper','openlower','openlower','openupper'});
    % 11 15
    % 12 15
    % 13 15
    % 14 15
    MaskParamCheck{2.0} = struct('CharString', {'AttributeName'});
    % 16 18
    % 17 18
    [valid1, errmsg1] = h.des_ddg_validateinputs(hdlg, MaskParamCheck);
    % 19 20
    if valid1
        valid2 = 1.0;
        errmsg2 = {};
        if hdlg.isEnabled('Minimum')
            [valid2, errmsg2] = validateRelation(h, hdlg, 'Minimum', '<', 'Maximum');
        end % if
    else
        valid2 = 1.0;
        errmsg2 = {};
    end % if
    % 30 31
    valid = and(valid1, valid2);
    % 32 33
    if not(valid)
        if not(valid2)
            ErrStruct = struct('Type', 'error', 'MessageID', 'DES_MASK_Numeric', 'Message', errmsg2, 'Handle', h.Block.Handle);
            % 36 39
            % 37 39
            % 38 39
            if not(valid1)
                lastMaskError = sllasterror;
                lastMaskError = horzcat(lastMaskError, ErrStruct);
                sllasterror(lastMaskError);
            else
                sllasterror(ErrStruct);
            end % if
        end % if
        errmsg = horzcat(errmsg1, errmsg2);
    else
        errmsg = '';
    end % if
end % function
function [valid2, errmsg2] = validateRelation(hBlock, hdlg, Param1, Relation, Param2)
    % 53 55
    % 54 55
    partOfMsg = 'must satisfy the condition:';
    Param1Str = eval(horzcat('hBlock.', Param1));
    Param2Str = eval(horzcat('hBlock.', Param2));
    if evalin('base', horzcat(Param1Str, Relation, Param2Str))
        valid2 = 1.0;
        errmsg2 = '';
    else
        valid2 = 0.0;
        % 63 64
        Param1Prompt = hdlg.getWidgetPrompt(Param1);
        Param1Prompt = Param1Prompt(1.0:minus(end, 1.0));
        % 66 67
        Param2Prompt = hdlg.getWidgetPrompt(Param2);
        Param2Prompt = Param2Prompt(1.0:minus(end, 1.0));
        % 69 70
        errmsg2 = cellhorzcat(horzcat(Param1Prompt, ' ', partOfMsg, char(10.0), Param1Prompt, ' ', Relation, ' ', Param2Prompt));
    end % if
end % function
