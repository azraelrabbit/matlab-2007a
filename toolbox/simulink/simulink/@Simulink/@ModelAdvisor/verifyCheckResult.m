function [success, message] = verifyCheckResult(this, matfileName, checkArray)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    success = false;
    message = '';
    % 10 11
    encodedModelName = modeladvisorprivate('HTMLjsencode', getfullname(this.System), 'encode');
    % 12 14
    % 13 14
    current_checkArray = {};
    % 15 17
    % 16 17
    condensedCheck = {};
    for i=1.0:length(this.CheckCellArray)
        if ismember(this.CheckCellArray{i}.TitleID, checkArray)
            % 20 21
            condensedCheck = this.CheckCellArray{i}.copy;
            condensedCheck.CallbackHandle = [];
            current_checkArray{plus(end, 1.0)} = condensedCheck;
        end % if
    end % for
    % 26 27
    if ne(length(current_checkArray), length(checkArray))
        success = false;
        message = 'Unable to find all specified checks in current context.';
        return;
    end % if
    % 32 34
    % 33 34
    if this.BaselineMode
        save(matfileName, 'current_checkArray');
        s = load(matfileName);
        if locCompareResult(current_checkArray, s.current_checkArray, encodedModelName)
            success = true;
            message = '';
        else
            success = false;
            message = horzcat('Save ', matfileName, ' failed.');
        end % if
        return;
    end % if
    % 46 51
    % 47 51
    % 48 51
    % 49 51
    % 50 51
    try
        s = load(matfileName);
    catch
        message = 'Can not load specified mat file';
        success = false;
        return;
    end % try
    % 58 60
    % 59 60
    if locCompareResult(current_checkArray, s.current_checkArray, encodedModelName)
        success = true;
        message = '';
    else
        success = false;
        message = horzcat('Saved ', matfileName, ' mismatch with current result.');
    end % if
    return;
end % function
function result = locCompareResult(checkArray1, checkArray2, encodedModelName)
    % 70 71
    result = false;
    % 72 73
    matchCounter = 0.0;
    for i=1.0:length(checkArray1)
        for j=1.0:length(checkArray2)
            if locCompareCheck(checkArray1{i}, checkArray2{j}, encodedModelName)
                matchCounter = plus(matchCounter, 1.0);
                break
            end % if
        end % for
    end % for
    if eq(matchCounter, length(checkArray1)) && eq(length(checkArray1), length(checkArray2))
        % 83 84
        result = true;
    else
        result = false;
    end % if
end % function
function result = locCompareCheck(check1, check2, encodedModelName)
    result = false;
    % 91 92
    if not(strcmp(check1.TitleID, check2.TitleID))
        result = false;
        return;
    end % if
    if not(strcmp(check1.CallbackStyle, check2.CallbackStyle))
        result = false;
        return;
    end % if
    % 100 101
    result = strcmp(locShuffleContents(check1.ResultInHTML, encodedModelName), locShuffleContents(check2.ResultInHTML, encodedModelName));
end % function
function outputStr = locShuffleContents(inputStr, encodedModelName)
    outputStr = regexprep(inputStr, '<!-- mdladv_ignore_start -->(.*?)<!-- mdladv_ignore_finish -->', 'ignore_contents');
    outputStr = regexprep(outputStr, '<A NAME="CheckRecord_(\w*)"</A>', '<A NAME="CheckRecord_SerialNumber"</A>');
    outputStr = regexprep(outputStr, horzcat('<a href="matlab: modeladvisorprivate hiliteSystem ', encodedModelName{:}, ' (\w+)">'), '<a href="ignore_contents">');
end % function
