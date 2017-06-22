function [tmf, envVal, otherOpts] = ert_default_tmf(varargin)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    if gt(nargin, 0.0)
        modelName = varargin{1.0};
    else
        modelName = bdroot;
    end % if
    osVal = LocalGetRTWOption(modelName, 'TargetOS', 'BareBoardExample');
    % 15 17
    sfVal = LocalGetRTWOption(modelName, 'GenerateErtSFunction', 0.0);
    % 17 19
    if strcmp(osVal, 'BareBoardExample')
        [tmf, envVal, otherOpts] = get_tmf_for_target('ert');
    else
        if strcmp(osVal, 'VxWorksExample')
            if eq(sfVal, 1.0)
                txt = horzcat('Note:', sprintf('\n'), 'Not compiling the VxWorks target code since the', sprintf('\n'), '"Create Simulink (S-Function) block option is selected.', sprintf('\n'), 'Building S-Function block instead.');
                % 24 32
                % 25 32
                % 26 32
                % 27 32
                % 28 32
                % 29 32
                % 30 32
                helpdlg(txt, 'Real-Time Workshop Embedded Coder Help');
                [tmf, envVal, otherOpts] = get_tmf_for_target('ert');
            else
                tmf = 'ert_tornado.tmf';
                envVal = '';
                otherOpts = [];
            end % if
        else
            DAStudio.error('RTW:targetSpecific:tmfUnavailable');
        end % if
    end % if
end % function
function value = LocalGetRTWOption(modelName, tlcVar, defaultVal)
    % 44 56
    % 45 56
    % 46 56
    % 47 56
    % 48 56
    % 49 56
    % 50 56
    % 51 56
    % 52 56
    % 53 56
    % 54 56
    rtwoptions = get_param(modelName, 'rtwoptions');
    % 56 58
    str = horzcat('-a', tlcVar, '=');
    idx = findstr(rtwoptions, str);
    % 59 61
    if isempty(idx)
        value = defaultVal;
        % 62 64
        if isnumeric(value)
            valueStr = num2str(value);
        else
            valueStr = value;
        end % if
        % 68 70
        warning(horzcat('Required option "', tlcVar, '" is not found in RTWOptions string; ', 'assuming the option value is "', valueStr, '".'));
        % 70 72
        disp('Please check your Embedded Coder manual regarding how to set up this option correctly.');
        % 72 74
        return;
    end % if
    % 75 77
    strLen = length(str);
    startIdx = plus(idx, strLen);
    nextChar = rtwoptions(startIdx);
    % 79 81
    if ne(nextChar, '"')
        value = str2double(nextChar);
    else
        startIdx = plus(startIdx, 1.0);
        endIdx = findstr(rtwoptions(startIdx:end), '"');
        value = rtwoptions(startIdx:minus(plus(startIdx, endIdx(1.0)), 2.0));
    end % if
end % function
