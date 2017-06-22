function GenerateRunScript(h)
    % 1 64
    % 2 64
    % 3 64
    % 4 64
    % 5 64
    % 6 64
    % 7 64
    % 8 64
    % 9 64
    % 10 64
    % 11 64
    % 12 64
    % 13 64
    % 14 64
    % 15 64
    % 16 64
    % 17 64
    % 18 64
    % 19 64
    % 20 64
    % 21 64
    % 22 64
    % 23 64
    % 24 64
    % 25 64
    % 26 64
    % 27 64
    % 28 64
    % 29 64
    % 30 64
    % 31 64
    % 32 64
    % 33 64
    % 34 64
    % 35 64
    % 36 64
    % 37 64
    % 38 64
    % 39 64
    % 40 64
    % 41 64
    % 42 64
    % 43 64
    % 44 64
    % 45 64
    % 46 64
    % 47 64
    % 48 64
    % 49 64
    % 50 64
    % 51 64
    % 52 64
    % 53 64
    % 54 64
    % 55 64
    % 56 64
    % 57 64
    % 58 64
    % 59 64
    % 60 64
    % 61 64
    % 62 64
    % 63 64
    sep = filesep;
    if eq(sep, '\')
        sep = '\\';
    end % if
    % 68 71
    % 69 71
    % 70 71
    switch lower(computer)
    case 'pcwin'
        cputype = 'win32';
    case 'glnx86'
        cputype = 'i386';
    case 'mac'
        cputype = 'mac';
    case 'hpux'
        cputype = 'hppa';
    case 'sol2'
        cputype = 'sparc';
    otherwise
        cputype = 'EDIT_THIS_NAME';
        aeroFGArchNotFoundMsgFmt = 'Generated batch file "%s" needs hand editing to work';
        warning('aeroblk:genrunscript:ArchNotFound', aeroFGArchNotFoundMsgFmt, h.OutputFileName);
        % 86 88
        % 87 88
    end % switch
    % 89 90
    if eq(h.FlightGearBaseDirectory(2.0), ':')
        % 91 95
        % 92 95
        % 93 95
        % 94 95
        fmt = horzcat(h.FlightGearBaseDirectory(1.0:2.0), '\n');
    else
        fmt = '';
    end % if
    fmt = horzcat(fmt, 'cd %s\n');
    fmt = horzcat(fmt, 'SET FG_ROOT=%s%sdata\n');
    fmt = horzcat(fmt, '.%sbin%s%s%sfgfs --aircraft=%s --fdm=network,localhost,5501,%s,5503 --fog-fastest --disable-clouds --start-date-lat=2004:06:01:09:00:00 --disable-sound --in-air --enable-freeze --airport-id=%s --runway=%s --altitude=%g --heading=%g --offset-distance=%g --offset-azimuth=%g\n');
    fh = fopen(h.OutputFileName, 'wt');
    fprintf(fh, fmt, h.FlightGearBaseDirectory, h.FlightGearBaseDirectory, sep, sep, sep, cputype, sep, h.GeometryModelName, h.DestinationPort, h.AirportId, h.RunwayId, h.InitialAltitude, h.InitialHeading, h.OffsetDistance, h.OffsetAzimuth);
    % 104 115
    % 105 115
    % 106 115
    % 107 115
    % 108 115
    % 109 115
    % 110 115
    % 111 115
    % 112 115
    % 113 115
    % 114 115
    fclose(fh);
    % 116 120
    % 117 120
    % 118 120
    % 119 120
    if not(exist(h.FlightGearBaseDirectory, 'dir'))
        aeroFGDirNotFoundMsg = 'The FlightGear base directory was not found at "%s" on this computer';
        warning('aero:genrunscript:FGDirNotFound', aeroFGDirNotFoundMsg, h.FlightGearBaseDirectory);
        % 123 125
        % 124 125
    end % if
end % function
