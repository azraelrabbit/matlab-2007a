function checkStrings(this)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    inds = strfind(this.PortTimes, ',');
    % 9 10
    if ne(length(inds), minus(this.NumPortRows, 1.0))
        % 11 12
        try
            pt = eval(this.PortTimes);
            ptStr = horzcat('[', num2str(pt(1.0)));
            for ii=2.0:length(pt)
                ptStr = horzcat(ptStr, ',', num2str(pt(ii)));
            end % for
            ptStr = horzcat(ptStr, ']');
        catch
            % 20 21
            ptStr = '[';
            for ii=1.0:this.NumPortRows
                ptStr = horzcat(ptStr, ',1');
            end % for
            ptStr = horzcat(ptStr, ']');
            % 26 27
            ptStr = ptStr(horzcat(1.0, 3.0:end));
        end % try
        this.PortTimes = ptStr;
    end % if
    % 31 33
    % 32 33
    inds = strfind(this.PortFracLengths, ',');
    % 34 35
    if ne(length(inds), minus(this.NumPortRows, 1.0))
        % 36 37
        try
            pf = eval(this.PortFracLengths);
            pfStr = horzcat('[', num2str(pf(1.0)));
            for ii=2.0:length(pf)
                pfStr = horzcat(pfStr, ',', num2str(pf(ii)));
            end % for
            pfStr = horzcat(pfStr, ']');
        catch
            % 45 46
            pfStr = '[';
            for ii=1.0:this.NumPortRows
                pfStr = horzcat(pfStr, ',0');
            end % for
            pfStr = horzcat(pfStr, ']');
            % 51 52
            pfStr = pfStr(horzcat(1.0, 3.0:end));
        end % try
        this.PortFracLengths = pfStr;
    end % if
    % 56 58
    % 57 58
    if gt(this.NumClockRows, 0.0)
        inds = strfind(this.ClockTimes, ',');
        % 60 61
        if ne(length(inds), minus(this.NumClockRows, 1.0))
            % 62 63
            try
                ct = eval(this.ClockTimes);
                ctStr = horzcat('[', num2str(ct(1.0)));
                for ii=2.0:length(ct)
                    ctStr = horzcat(ctStr, ',', num2str(ct(ii)));
                end % for
                ctStr = horzcat(ctStr, ']');
            catch
                % 71 72
                ctStr = '[';
                for ii=1.0:this.NumClockRows
                    ctStr = horzcat(ctStr, ',2');
                end % for
                ctStr = horzcat(ctStr, ']');
                if gt(this.NumClockRows, 1.0)
                    % 78 79
                    ctStr = ctStr(horzcat(1.0, 3.0:end));
                end % if
            end % try
            this.ClockTimes = ctStr;
        end % if
    end % if
end % function
