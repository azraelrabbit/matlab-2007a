function replace = askToReplace(h, block)
    % 1 12
    % 2 12
    % 3 12
    % 4 12
    % 5 12
    % 6 12
    % 7 12
    % 8 12
    % 9 12
    % 10 12
    % 11 12
    if getPrompt(h)
        % 13 14
        name = cleanBlockName(h, block);
        SL_ReplacementPrompt = DAStudio.message('Simulink:utility:slupdateReplacementPrompt', name);
        replaceReply = input(SL_ReplacementPrompt, 's');
        % 17 18
        if isempty(replaceReply)
            replace = true;
        else
            switch replaceReply(1.0)
            case 'y'
                replace = true;
            case 'n'
                replace = false;
                dispSkipping(h, block);
            case 'a'
                replace = true;
                h.Prompt = false;
            otherwise
                % 31 32
                DAStudio.warning('Simulink:utility:slupdateInvalidPromptResponse', replaceReply);
                replace = false;
                dispSkipping(h, block);
            end % switch
        end % if
    else
        replace = true;
    end % if
    % 40 41
end % function
