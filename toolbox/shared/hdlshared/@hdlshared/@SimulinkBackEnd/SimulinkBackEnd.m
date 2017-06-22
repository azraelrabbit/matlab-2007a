function this = SimulinkBackEnd(hPir, varargin)
    % 1 13
    % 2 13
    % 3 13
    % 4 13
    % 5 13
    % 6 13
    % 7 13
    % 8 13
    % 9 13
    % 10 13
    % 11 13
    this = hdlshared.SimulinkBackEnd;
    % 13 15
    if ~(isa(hPir, 'hdlcoder.pir'))
        error(hdlerrormsgid('SimulinkBackEnd:invalidconstruction'), 'First argument must be a Pir object.');
        % 16 18
    end
    % 18 20
    this.hPir = hPir;
    % 20 23
    % 21 23
    if ispc
        this.dotTool = 'mwdot.exe';
    else
        this.dotTool = 'mwdot';
    end
    % 27 29
    arch = lower(computer);
    if strcmp(arch, 'pcwin')
        arch = 'win32';
    else
        if strcmp(arch, 'pcwin64')
            arch = 'win64';
        end
    end
    this.dotPath = fullfile(matlabroot, 'bin', arch);
    % 37 39
    this.DotFile = '';
    this.DotFileExt = '.dot';
    % 40 43
    % 41 43
    this.LayoutFileExt = '.plain';
    this.LayoutFile = '';
    % 44 47
    % 45 47
    this.SaveTemps = 'no';
    % 47 50
    % 48 50
    this.AutoRoute = 'on';
    % 50 53
    % 51 53
    this.UseModelReference = 'no';
    % 53 56
    % 54 56
    this.HMargin = 70.0;
    this.VMargin = 50.0;
    % 57 63
    % 58 63
    % 59 63
    % 60 63
    % 61 63
    this.BlockSizeScale = 2.0;
    % 63 66
    % 64 66
    this.B2BHScale = 1.5;
    this.B2BVScale = 1.2;
    % 67 73
    % 68 73
    % 69 73
    % 70 73
    % 71 73
    this.H2VAspectRatio = 1.3333333333333333;
    % 73 78
    % 74 78
    % 75 78
    % 76 78
    this.BlockWidth = 30.0;
    this.BlockHeight = 30.0;
    % 79 84
    % 80 84
    % 81 84
    % 82 84
    this.SubsystemWidth = 80.0;
    this.SubsystemHeight = 30.0;
    % 85 89
    % 86 89
    % 87 89
    this.PortWidth = 30.0;
    this.PortHeight = 14.0;
    % 90 92
    this.TotalRunTime = '0.0';
    this.SolverName = 'FixedStepDiscrete';
    this.FixedStepSize = 'auto';
    % 94 98
    % 95 98
    % 96 98
    this.OutModelFile = '';
    this.ShowModel = 'yes';
    % 99 123
    % 100 123
    % 101 123
    % 102 123
    % 103 123
    % 104 123
    % 105 123
    % 106 123
    % 107 123
    % 108 123
    % 109 123
    % 110 123
    % 111 123
    % 112 123
    % 113 123
    % 114 123
    % 115 123
    % 116 123
    % 117 123
    % 118 123
    % 119 123
    % 120 123
    % 121 123
    this.RootNetworkName = '';
    this.SourceModelValid = 0.0;
    % 124 127
    % 125 127
    this.SetDataTypesFromPir = 'no';
    % 127 129
    pvlist = cellhorzcat(varargin{:});
    % 129 131
    if eq(mod(length(pvlist), 2.0), 1.0)
        error(hdlerrormsgid('simulinkbackend'), 'Number of parameter value pairs must be even.');
        % 132 134
    end
    % 134 136
    for n=1.0:2.0:length(pvlist)
        this.(pvlist{n}) = pvlist{plus(n, 1.0)};
    end % for
end
