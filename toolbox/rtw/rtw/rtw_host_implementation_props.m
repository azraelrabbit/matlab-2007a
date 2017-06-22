function value = rtw_host_implementation_props(model)
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
    try
        % 12 31
        % 13 31
        % 14 31
        % 15 31
        % 16 31
        % 17 31
        % 18 31
        % 19 31
        % 20 31
        % 21 31
        % 22 31
        % 23 31
        % 24 31
        % 25 31
        % 26 31
        % 27 31
        % 28 31
        % 29 31
        % 30 31
        host_cpu = hostcpuinfo;
        % 32 33
        value.ShiftRightIntArith = eq(host_cpu(1.0), 1.0);
        if eq(host_cpu(3.0), 0.0)
            value.Endianess = 'LittleEndian';
        else
            value.Endianess = 'BigEndian';
        end % if
    catch
        % 40 46
        % 41 46
        % 42 46
        % 43 46
        % 44 46
        % 45 46
        error('RTW:UnknownMatlabHost', 'Code generation encountered a fatal error because the MATLAB host computer is unknown.  Go to the Simulink model''s Configuration Parameters dialog and look at the Hardware Implementation pane. The Emulation Hardware section specifies that the Device type is MATLAB Host Computer.  However, an attempt to run the mex file ''hostcpuinfo'' has failed. Real Time Workshop can not determine information needed to give correct and efficient code generation.');
        % 47 54
        % 48 54
        % 49 54
        % 50 54
        % 51 54
        % 52 54
        % 53 54
    end % try
end % function
