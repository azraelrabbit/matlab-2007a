function dumphdlentitysignals(entry)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    if hdlisbeta2
        error(horzcat('Unexpected HDL Coder call to ', mfilename));
    end % if
    % 10 12
    signalTable = hdlgetsignaltable;
    % 12 14
    if not(signalTable.isEmpty)
        % 14 16
        lastsig = hdllastsignal;
        % 16 18
        if eq(nargin, 0.0)
            entry = 1.0:lastsig;
        end % if
        % 20 22
        entry(gt(entry, lastsig)) = 0.0;
        % 22 24
        fprintf(1.0, '\n');
        for n=entry
            % 25 29
            % 26 29
            % 27 29
            if ne(n, 0.0)
                if hdlisinportsignal(n)
                    portchar = 'i';
                else
                    if hdlisoutportsignal(n)
                        portchar = 'o';
                    else
                        portchar = ' ';
                    end % if
                end % if
                isvector = signalTable.getVector(n);
                name = hdlsignalname(n);
                complex = signalTable.getComplex(n);
                vtype = signalTable.getVType(n);
                sltype = signalTable.getSLType(n);
                rate = signalTable.getRate(n);
                forward = signalTable.getForwards(n);
                handle = hdlsignalhandle(n);
                if eq(isvector, 0.0)
                    fprintf(1.0, '%4d: %s %-32s %-20e c=%d %s %s r=%-10e', n, portchar, name, handle, complex, vtype, sltype, rate);
                else
                    % 49 57
                    % 50 57
                    % 51 57
                    % 52 57
                    % 53 57
                    % 54 57
                    % 55 57
                    % 56 58
                    fprintf(1.0, '%4d: %s %-32s %-20e c=%d [%d %d] %s %s r=%-10e', n, portchar, name, handle, complex, isvector(1.0), isvector(2.0), vtype, sltype, rate);
                    % 58 68
                    % 59 68
                    % 60 68
                    % 61 68
                    % 62 68
                    % 63 68
                    % 64 68
                    % 65 68
                    % 66 68
                end % if
                % 68 70
                if ne(forward, 0.0)
                    fprintf(1.0, ' forwarded to: [ ');
                    fprintf(1.0, '%d ', forward);
                    fprintf(1.0, ']');
                end % if
                % 74 76
                fprintf(1.0, '\n');
                % 76 78
            end % if
        end % for
    end % if
end % function
