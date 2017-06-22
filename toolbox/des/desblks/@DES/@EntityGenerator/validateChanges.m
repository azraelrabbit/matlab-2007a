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
    MaskParamCheck{1.0} = struct('Numeric', {'time','PriorityEntityGeneration','minUnif','maxUnif','mean','sampleTime','offsetTime','seed'}, 'isValid', {'IsReal','IsInt','IsReal','IsReal','IsReal','IsReal','IsReal','IsInt'}, 'inRange', {[0.0,inf],[1.0,inf],[0.0,inf],[0.0,inf],[0.0,inf],[-1.0,inf],[0.0,inf],[0.0,inf]}, 'rangeOpt', {'openlower','closeboth','openupper','openlower','openlower','closeboth','openupper','openlower'});
    % 11 15
    % 12 15
    % 13 15
    % 14 15
    MaskParamCheck{2.0} = struct('CharString', {'entityName','attrNameCount'});
    % 16 18
    % 17 18
    [valid1, errmsg1] = h.des_ddg_validateinputs(hdlg, MaskParamCheck);
    % 19 20
    if valid1
        valid2 = 1.0;
        errmsg2 = {};
        if hdlg.isEnabled('offsetTime') && gt(str2num(h.sampleTime), 0.0)
            [valid2, errmsg2] = validateRelation(h, hdlg, 'offsetTime', '<', 'sampleTime');
        end % if
        % 26 27
        valid3 = 1.0;
        errmsg3 = {};
        if hdlg.isEnabled('minUnif')
            [valid3, errmsg3] = validateRelation(h, hdlg, 'minUnif', '<', 'maxUnif');
        end % if
    else
        valid2 = 0.0;
        errmsg2 = {};
        valid3 = 0.0;
        errmsg3 = {};
    end % if
    % 38 39
    valid = and(and(valid1, valid2), valid3);
    % 40 41
    if not(valid)
        errmsg = horzcat(errmsg1, errmsg2, errmsg3);
    else
        errmsg = '';
    end % if
end % function
function [valid2, errmsg2] = validateRelation(hBlock, hdlg, Param1, Relation, Param2)
    % 48 50
    % 49 50
    partOfMsg = 'must satisfy the condition:';
    Param1Str = eval(horzcat('hBlock.', Param1));
    Param2Str = eval(horzcat('hBlock.', Param2));
    if evalin('base', horzcat(Param1Str, Relation, Param2Str))
        valid2 = 1.0;
        errmsg2 = '';
    else
        valid2 = 0.0;
        % 58 59
        Param1Prompt = hdlg.getWidgetPrompt(Param1);
        Param1Prompt = Param1Prompt(1.0:minus(end, 1.0));
        % 61 62
        Param2Prompt = hdlg.getWidgetPrompt(Param2);
        Param2Prompt = Param2Prompt(1.0:minus(end, 1.0));
        % 64 65
        errmsg2 = cellhorzcat(horzcat(Param1Prompt, ' ', partOfMsg, char(10.0), Param1Prompt, ' ', Relation, ' ', Param2Prompt));
    end % if
end % function
