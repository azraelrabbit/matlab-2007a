function [valid, errmsg] = validateChanges(h, hdlg)
    % 1 11
    % 2 11
    % 3 11
    % 4 11
    % 5 11
    % 6 11
    % 7 11
    % 8 11
    % 9 11
    % 10 11
    MaskParamCheck{1.0} = struct('Numeric', {'PriorityEntityGeneration'}, 'isValid', {'IsInt'}, 'inRange', {[1.0,inf]}, 'rangeOpt', {'closeboth'});
    % 12 21
    % 13 21
    % 14 21
    % 15 21
    % 16 21
    % 17 21
    % 18 21
    % 19 21
    % 20 21
    [valid, errmsg] = h.des_ddg_validateinputs(hdlg, MaskParamCheck);
    % 22 26
    % 23 26
    % 24 26
    % 25 26
    if valid
        errmsg = '';
    end % if
end % function
function [valid2, errmsg2] = validateRelation(hBlock, hdlg, Param1, Relation, Param2)
    % 31 33
    % 32 33
    partOfMsg = 'must satisfy the condition:';
    Param1Str = eval(horzcat('hBlock.', Param1));
    Param2Str = eval(horzcat('hBlock.', Param2));
    if evalin('base', horzcat(Param1Str, Relation, Param2Str))
        valid2 = 1.0;
        errmsg2 = '';
    else
        valid2 = 0.0;
        % 41 42
        Param1Prompt = hdlg.getWidgetPrompt(Param1);
        Param1Prompt = Param1Prompt(1.0:minus(end, 1.0));
        % 44 45
        Param2Prompt = hdlg.getWidgetPrompt(Param2);
        Param2Prompt = Param2Prompt(1.0:minus(end, 1.0));
        % 47 48
        errmsg2 = cellhorzcat(horzcat(Param1Prompt, ' ', partOfMsg, char(10.0), Param1Prompt, ' ', Relation, ' ', Param2Prompt));
    end % if
end % function
