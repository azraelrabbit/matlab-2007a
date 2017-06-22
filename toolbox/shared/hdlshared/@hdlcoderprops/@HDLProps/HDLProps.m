function this = HDLProps(varargin)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    this = hdlcoderprops.HDLProps;
    % 7 10
    % 8 10
    this.INI = createINI;
    % 10 13
    % 11 13
    this.CLI = hdlcoderprops.CLI(varargin{:});
    % 13 15
    hGC = this.INI.getPropSet('Global', 'Common');
    % 15 17
    hListener = handle.listener(hGC, hGC.findprop('target_language'), 'PropertyPostSet', @(h,ed)targetLanguageChanged(this));
    % 17 19
    set(this, 'TargetLanguageListener', hListener);
    % 19 22
    % 20 22
    targetLanguageChanged(this);
end
function targetLanguageChanged(this)
    % 24 27
    % 25 27
    hGbl = this.INI.getPropSet('Global');
    % 27 29
    if strcmpi(hGbl.getProp('target_language'), 'VHDL')
        hGbl.enablePropSet('VHDL', true);
        hGbl.enablePropSet('Verilog', false);
    else
        hGbl.enablePropSet('Verilog', true);
        hGbl.enablePropSet('VHDL', false);
    end
end
function props = createINI
    % 37 44
    % 38 44
    % 39 44
    % 40 44
    % 41 44
    % 42 44
    names = {'Common','VHDL','Verilog'};
    sets = cellhorzcat(hdlcoderprops.GlobalCommon, hdlcoderprops.GlobalVHDL, hdlcoderprops.GlobalVerilog);
    % 45 48
    % 46 48
    Global = propset.leaf(names, sets);
    % 48 51
    % 49 51
    names = {'Common'};
    sets = cellhorzcat(hdlcoderprops.TestBenchCommon);
    TestBench = propset.leaf(names, sets);
    % 53 56
    % 54 56
    names = {'Compilation','Mapping','Simulation','Synthesis','Projects'};
    sets = cellhorzcat(hdlcoderprops.EDACompilation, hdlcoderprops.EDAMapping, hdlcoderprops.EDASimulation, hdlcoderprops.EDASynthesis, hdlcoderprops.EDAProjects);
    % 57 62
    % 58 62
    % 59 62
    % 60 62
    EDAScript = propset.leaf(names, sets);
    % 62 64
    Filter = propset.leaf({'Common'}, cellhorzcat(hdlcoderprops.FilterCommon));
    % 64 67
    % 65 67
    names = {'Global','TestBench','EDAScript','Filter'};
    sets = cellhorzcat(Global, TestBench, EDAScript, Filter);
    props = propset.tree(names, sets);
end
