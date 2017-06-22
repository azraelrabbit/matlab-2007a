function hdlcode = emit(this, hC)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    bfp = hC.SimulinkHandle;
    % 7 9
    blkobj = get_param(bfp, 'Object');
    name = hdllegalname(get(blkobj, 'Name'));
    % 10 12
    portpaths = get(blkobj, 'PortPaths');
    portmodes = evalin('base', get(blkobj, 'PortModes'));
    clkpaths = get(blkobj, 'ClockPaths');
    clkmodes = evalin('base', get(blkobj, 'ClockModes'));
    % 15 17
    phan = get_param(bfp, 'PortHandles');
    % 17 19
    if eq(length(clkmodes), 1.0)
        [cpath, clkname] = this.mtidehierarchyname(clkpaths);
    else
        clkpathsep = find(eq(clkpaths, ';'));
        if isempty(clkpathsep)
            error(hdlcodererrormsgid('clockportnumbermismatch'), 'Wrong number of clock ports found in Link For ModelSim block %s', horzcat(get(blkobj, 'Path'), '/', get(blkobj, 'Name')));
            % 24 27
            % 25 27
        end
        [cpath, clkname] = this.mtidehierarchyname(clkpaths(1.0:minus(clkpathsep(1.0), 1.0)));
    end
    % 29 32
    % 30 32
    portpathsep = find(eq(portpaths, ';'));
    if ne(plus(length(portpathsep), 1.0), length(portmodes))
        error(hdlcodererrormsgid('portnumbermismatch'), 'Wrong number of ports found in Link For ModelSim block %s', horzcat(get(blkobj, 'Path'), '/', get(blkobj, 'Name')));
        % 34 37
        % 35 37
    end
    % 37 39
    entityportnames = {};
    if isempty(portpathsep)
        [notused, entityportnames{plus(end, 1.0)}] = this.mtidehierarchyname(portpaths);
    else
        st = 1.0;
        testpath = cpath;
        for n=1.0:length(portpathsep)
            [path, entityportnames{plus(end, 1.0)}] = this.mtidehierarchyname(portpaths(st:minus(portpathsep(n), 1.0)));
            st = plus(portpathsep(n), 1.0);
            if not(isempty(path)) && isempty(testpath)
                testpath = path;
            else
                if not(isempty(path)) && not(isempty(testpath))
                    if not(strcmp(path, testpath))
                        error(hdlcodererrormsgid('pathmismatch'), 'All HDL ports must be at a single hierarchical level for HDL code generation');
                        % 53 55
                    end
                end
            end
        end % for
        [path, entityportnames{plus(end, 1.0)}] = this.mtidehierarchyname(portpaths(st:end));
        if not(isempty(path)) && not(isempty(testpath))
            if not(strcmp(path, testpath))
                error(hdlcodererrormsgid('pathmismatch'), 'All HDL ports must be at a single hierarchical level for HDL code generation');
                % 62 64
            end
        end
    end
    % 66 69
    % 67 69
    inentityports = entityportnames(eq(portmodes, 1.0));
    outentityports = entityportnames(eq(portmodes, 2.0));
    % 70 72
    userData = this.getHDLUserData(hC);
    % 72 74
    if userData.hasClock
        inportOffset = 3.0;
        hC.setInputPortName(0.0, hdllegalnamersvd(clkname));
    else
        inportOffset = 0.0;
    end
    % 79 82
    % 80 82
    for n=1.0:length(phan.Inport)
        hC.setInputPortName(minus(plus(n, inportOffset), 1.0), hdllegalnamersvd(inentityports(n)));
    end % for
    % 84 86
    for n=1.0:length(phan.Outport)
        hC.setOutputPortName(minus(n, 1.0), hdllegalnamersvd(outentityports(n)));
    end % for
    % 88 90
    hdlcode.entity_name = name;
    hdlcode.arch_name = 'rtl';
    hdlcode.component_name = name;
end
