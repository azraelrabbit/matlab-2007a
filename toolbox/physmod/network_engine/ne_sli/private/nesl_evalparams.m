function nesl_evalparams(block)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    persistent FCN;
    % 9 11
    if isempty(FCN)
        FCN = pm_private('pm_evalparams');
    end
    % 13 15
    blockH = get_param(block, 'Handle');
    % 15 17
    blockN = getfullname(blockH);
    % 17 19
    evalKey = horzcat(blockN, '/EVAL_KEY');
    % 19 21
    evalKeyH = get_param(evalKey, 'Handle');
    % 21 23
    FCN(evalKeyH);
    % 23 25
end
