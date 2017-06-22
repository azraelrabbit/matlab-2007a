function schema
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    pkg = findpackage('Aero');
    c = schema.class(pkg, 'FlightGearAnimation');
    % 11 19
    % 12 19
    % 13 19
    % 14 19
    % 15 19
    % 16 19
    % 17 19
    if isempty(findtype('Aero.FlightGearAnimation.FlightGearVersionEnum'))
        schema.EnumType('Aero.FlightGearAnimation.FlightGearVersionEnum', {'0.9.3','0.9.8','0.9.9','0.9.10'});
        % 20 22
    end % if
    % 22 27
    % 23 27
    % 24 27
    % 25 27
    sdata = vertcat({'TimeseriesSource','off','MATLAB array',[]}, {'TimeseriesSourceType','off','Aero.TimeseriesTypeEnum','Array6DoF'}, cellhorzcat('TimeseriesReadFcn', 'off', 'MATLAB array', @Array6DoFRead), {'TimeScaling','off','double',[1.0]}, {'FramesPerSecond','off','double',[12.0]}, {'FlightGearVersion','off','Aero.FlightGearAnimation.FlightGearVersionEnum','0.9.10'}, {'OutputFileName','off','string','runfg.bat'}, {'FlightGearBaseDirectory','off','string','D:\Applications\FlightGear'}, {'GeometryModelName','off','string','HL20'}, {'DestinationIpAddress','off','string','127.0.0.1'}, {'DestinationPort','off','string','5502'}, {'AirportId','off','string','KSFO'}, {'RunwayId','off','string','10L'}, {'InitialAltitude','off','double',[7224.0]}, {'InitialHeading','off','double',[113.0]}, {'OffsetDistance','off','double',[4.72]}, {'OffsetAzimuth','off','double',[0.0]}, {'FGIdx','off','double',[4.0]}, {'FGDest','off','java.net.Inet4Address',[]}, {'FGSocket','off','java.net.DatagramSocket',[]}, {'FGTimer','off','MATLAB array',[]});
    % 27 52
    % 28 52
    % 29 52
    % 30 52
    % 31 52
    % 32 52
    % 33 52
    % 34 52
    % 35 52
    % 36 52
    % 37 52
    % 38 52
    % 39 52
    % 40 52
    % 41 52
    % 42 52
    % 43 52
    % 44 52
    % 45 52
    % 46 52
    % 47 52
    % 48 52
    % 49 52
    % 50 52
    propType = {'TimeseriesSourceType','TimeseriesReadFcn'};
    fcnType = cellhorzcat(@setFcnType, @setFcnRead);
    % 53 55
    for k=1.0:size(sdata, 1.0)
        p = schema.prop(c, sdata{k, 1.0}, sdata{k, 3.0});
        p.AccessFlags.Serialize = sdata{k, 2.0};
        p.FactoryValue = sdata{k, 4.0};
        match = strmatch(sdata{k, 1.0}, propType, 'exact');
        if match
            p.setFunction = fcnType{match};
        end % if
        if any(strmatch(sdata{k, 1.0}, {'FGIdx','FGDest','FGSocket','FGTimer'}, 'exact'))
            p.Visible = 'off';
            p.AccessFlags.publicSet = 'off';
        end % if
    end % for
    % 67 69
end % function
function data = setFcnType(h, val)
    % 70 76
    % 71 76
    % 72 76
    % 73 76
    % 74 76
    sourceType = set(h, 'TimeseriesSourceType');
    readType = cellhorzcat('TimeseriesRead', 'Array6DoFRead', 'Array3DoFRead', 'StructTimeRead', h.TimeseriesReadFcn);
    % 77 80
    % 78 80
    h.TimeseriesReadFcn = initReadFcn(readType{strmatch(val, sourceType, 'exact')}, h);
    % 80 82
    data = val;
    % 82 84
end % function
function data = setFcnRead(h, val)
    % 85 89
    % 86 89
    % 87 89
    data = initReadFcn(val, h);
    % 89 91
end % function
