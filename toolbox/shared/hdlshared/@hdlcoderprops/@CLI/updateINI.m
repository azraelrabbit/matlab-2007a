function [success, msg] = updateINI(this, hINI)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    success = true;
    msg = [];
    % 9 14
    % 10 14
    % 11 14
    % 12 14
    try
        clockHighTime = lclevaluatevars(this, 'ClockHighTime');
        clockLowTime = lclevaluatevars(this, 'ClockLowTime');
        holdTime = lclevaluatevars(this, 'HoldTime');
        errorMargin = lclevaluatevars(this, 'ErrorMargin');
        verbosity = lclevaluatevars(this, 'Verbosity');
        % 19 23
        % 20 23
        % 21 23
        tbUserStim = lclevaluatevars(this, 'TestBenchUserStimulus');
    catch
        % 24 26
        if nargout
            % 26 28
            success = false;
            msg = lasterror;
            return;
        else
            rethrow(lasterror);
        end % if
    end % try
    % 34 39
    % 35 39
    % 36 39
    % 37 39
    hGC = hINI.getPropSet('Global').getPropSet('Common');
    hTC = hINI.getPropSet('TestBench').getPropSet('Common');
    hEC = hINI.getPropSet('EDAScript').getPropSet('Compilation');
    hEM = hINI.getPropSet('EDAScript').getPropSet('Mapping');
    hES = hINI.getPropSet('EDAScript').getPropSet('Simulation');
    hESn = hINI.getPropSet('EDAScript').getPropSet('Synthesis');
    hEP = hINI.getPropSet('EDAScript').getPropSet('Projects');
    hGV = hINI.getPropSet('Global').getPropSet('VHDL');
    hGVg = hINI.getPropSet('Global').getPropSet('Verilog');
    hFC = hINI.getPropSet('Filter').getPropSet('Common');
    % 48 50
    sGC = rmfield(get(hGC), {'isvhdl','isverilog'});
    sTC = get(hTC);
    sEC = get(hEC);
    sEM = get(hEM);
    sES = get(hES);
    sESn = get(hESn);
    sEP = get(hEP);
    sGV = get(hGV);
    sGVg = get(hGVg);
    sFC = get(hFC);
    % 59 61
    try
        % 61 64
        % 62 64
        hGC.target_language = this.TargetLanguage;
        hGC.reserved_word_postfix = this.ReservedWordPostfix;
        hGC.product_of_elements_style = this.ProductOfElementsStyle;
        hGC.async_reset = strcmpi(this.ResetType, 'asynchronous');
        hGC.bit_true_to_filter = strcmpi(this.OptimizeForHDL, 'off');
        hGC.cast_before_sum = strcmpi(this.CastBeforeSum, 'on');
        hGC.checkhdl = strcmpi(this.CheckHDL, 'on');
        hGC.enableprefix = legalHDLName(this, 'EnablePrefix', 'reserved');
        hGC.clockenablename = legalHDLName(this, 'ClockEnableInputPort', 'reserved');
        hGC.clockenableoutputname = legalHDLName(this, 'ClockEnableOutputPort', 'reserved');
        hGC.clockinputs = find(strcmpi(this.ClockInputs, set(this, 'ClockInputs')));
        hGC.clockname = legalHDLName(this, 'ClockInputPort', 'reserved');
        hGC.codegendir = this.TargetDirectory;
        hGC.gain_multipliers = this.GainMultipliers;
        hGC.simulator_flags = this.SimulatorFlags;
        hGC.sum_of_elements_style = this.SumOfElementsStyle;
        hGC.rcs_cvs_tag = hdlformatcomment(this.UserComment);
        hGC.resetname = legalHDLName(this, 'ResetInputPort', 'reserved');
        hGC.verbose = verbosity;
        hGC.reset_asserted_level = minus(find(strcmpi(this.ResetAssertedLevel, set(this, 'ResetAssertedLevel'))), 1.0);
        % 83 85
        hGC.code_gen_method = this.CodeGenMethod;
        % 85 87
        hGC.block_generate_label = this.BlockGenerateLabel;
        hGC.clock_process_label = this.ClockProcessPostfix;
        hGC.complex_imag_postfix = this.ComplexImagPostfix;
        hGC.complex_real_postfix = this.ComplexRealPostfix;
        hGC.entity_conflict_postfix = this.EntityConflictPostfix;
        hGC.instance_generate_label = this.InstanceGenerateLabel;
        hGC.instance_prefix = this.InstancePrefix;
        hGC.output_generate_label = this.OutputGenerateLabel;
        hGC.vector_prefix = this.VectorPrefix;
        hGC.vhdl_file_ext = this.VHDLFileExtension;
        hGC.verilog_file_ext = this.VerilogFileExtension;
        hGC.clock_rising_edge = strcmpi(this.UseRisingEdge, 'on');
        hGC.debug = strcmpi(this.Debug, 'on');
        hGC.gen_eda_scripts = strcmpi(this.EDAScriptGeneration, 'on');
        hGC.hdlconfigfiles = this.HDLControlFiles;
        % 101 105
        % 102 105
        % 103 105
        hGC.codegenerationoutput = this.CodeGenerationOutput;
        hGC.generatedmodelname = this.GeneratedModelName;
        hGC.generatedmodelnameprefix = this.GeneratedModelNamePrefix;
        hGC.usedotlayout = strcmpi(this.UseDotLayout, 'on');
        hGC.useslautoroute = strcmpi(this.UseSLAutoRoute, 'on');
        hGC.hiliteancestors = strcmpi(this.HighlightAncestors, 'on');
        hGC.hilitecolor = this.HighlightColor;
        % 111 114
        % 112 114
        hGC.multiratebetafeature = strcmpi(this.MultirateBetaFeature, 'on');
        % 114 117
        % 115 117
        hTC.tb_name = legalHDLName(this, 'TestBenchName', 'reserved');
        hTC.tb_postfix = this.TestBenchPostfix;
        hTC.tb_stimulus = this.TestBenchStimulus;
        hTC.tb_user_stimulus = tbUserStim;
        hTC.tb_fracdelay_stimulus = this.TestBenchFracDelayStimulus;
        hTC.force_clockenable = strcmpi(this.ForceClockEnable, 'on');
        hTC.force_clockenable_value = find(strcmpi(this.ClockEnableValue, set(this, 'ClockEnableValue')));
        % 123 125
        hTC.force_clock = strcmpi(this.ForceClock, 'on');
        hTC.force_clock_high_time = clockHighTime;
        hTC.force_clock_low_time = clockLowTime;
        hTC.force_reset = strcmpi(this.ForceReset, 'on');
        hTC.force_hold_time = holdTime;
        hTC.error_margin = errorMargin;
        hTC.force_reset_value = minus(find(strcmpi(this.ResetAssertedLevel, set(this, 'ResetAssertedLevel'))), 1.0);
        % 131 135
        % 132 135
        % 133 135
        hEC.hdlcompilefilepostfix = this.HDLCompileFilePostfix;
        hEC.hdlcompileinit = this.HDLCompileInit;
        hEC.hdlcompileterm = this.HDLCompileTerm;
        hEC.hdlcompileverilogcmd = this.HDLCompileVerilogCmd;
        hEC.hdlcompilevhdlcmd = this.HDLCompileVHDLCmd;
        % 139 142
        % 140 142
        hEM.hdlmapfilepostfix = this.HDLMapFilePostfix;
        hEM.hdlmapseparator = this.HDLMapSeparator;
        % 143 146
        % 144 146
        hES.hdlsimcmd = this.HDLSimCmd;
        hES.hdlsimfilepostfix = this.HDLSimFilePostfix;
        hES.hdlsiminit = this.HDLSimInit;
        hES.hdlsimterm = this.HDLSimTerm;
        hES.hdlsimviewwavecmd = this.HDLSimViewWaveCmd;
        % 150 153
        % 151 153
        hEP.hdlsimprojectcmd = this.HDLSimProjectCmd;
        hEP.hdlsimprojectterm = this.HDLSimProjectTerm;
        hEP.hdlsimprojectfilepostfix = this.HDLSimProjectFilePostfix;
        hEP.hdlsimprojectinit = this.HDLSimProjectInit;
        % 156 159
        % 157 159
        hESn.hdlsynthcmd = this.HDLSynthCmd;
        hESn.hdlsynthfilepostfix = this.HDLSynthFilePostfix;
        hESn.hdlsynthinit = this.HDLSynthInit;
        hESn.hdlsynthterm = this.HDLSynthTerm;
        % 162 165
        % 163 165
        hGV.loop_unrolling = strcmpi(this.LoopUnrolling, 'on');
        hGV.inline_configurations = strcmpi(this.InlineConfigurations, 'on');
        hGV.package_suffix = this.PackagePostfix;
        hGV.use_aggregates_for_const = strcmpi(this.UseAggregatesForConst, 'on');
        hGV.safe_zero_concat = strcmpi(this.SafeZeroConcat, 'on');
        hGV.split_arch_file_postfix = this.SplitArchFilePostfix;
        hGV.split_entity_file_postfix = this.SplitEntityFilePostfix;
        hGV.split_entity_arch = strcmpi(this.SplitEntityArch, 'on');
        % 172 175
        % 173 175
        hGVg.use_verilog_timescale = strcmpi(this.UseVerilogTimescale, 'on');
        % 175 178
        % 176 178
        hFC.filter_coeff_name = this.CoeffPrefix;
        hFC.filter_fir_final_adder = this.FIRAdderStyle;
        hFC.filter_multipliers = this.CoeffMultipliers;
        hFC.filter_input_type_std_logic = strcmpi(this.InputType, 'std_logic_vector');
        hFC.filter_output_type_std_logic = filterOutputStdlogic(this);
        hFC.filter_registered_input = strcmpi(this.AddInputRegister, 'on');
        hFC.filter_registered_output = strcmpi(this.AddOutputRegister, 'on');
        hFC.filter_pipelined = strcmpi(this.AddPipelineRegisters, 'on');
        if not(isempty(this.InputPort))
            hFC.filter_input_name = legalHDLName(this, 'InputPort', 'reserved');
        end % if
        if not(isempty(this.OutputPort))
            hFC.filter_output_name = legalHDLName(this, 'OutputPort', 'reserved');
        end % if
        if not(isempty(this.Name))
            hFC.filter_name = legalHDLName(this, 'Name', 'reserved');
        end % if
        if not(isempty(this.FracDelayPort))
            hFC.filter_fracdelay_name = legalHDLName(this, 'FracDelayPort', 'reserved');
        end % if
        hFC.filter_reuseaccum = strcmpi(this.ReuseAccum, 'on');
        hFC.filter_scalewarnbits = this.ScaleWarnBits;
        hFC.filter_serialsegment_inputs = this.SerialPartition;
        hFC.filter_dalutpartition = this.DALUTPartition;
        hFC.filter_daradix = this.DARadix;
    catch
        % 203 207
        % 204 207
        % 205 207
        set(hGC, sGC);
        set(hTC, sTC);
        set(hEC, sEC);
        set(hEM, sEM);
        set(hES, sES);
        set(hESn, sESn);
        set(hEP, sEP);
        set(hGV, sGV);
        set(hGVg, sGVg);
        set(hFC, sFC);
        % 216 218
        if nargout
            % 218 220
            success = false;
            msg = lasterror;
        else
            rethrow(lasterror);
        end % if
    end % try
function value = lclevaluatevars(this, property)
    % 226 230
    % 227 230
    % 228 230
    value = get(this, property);
    % 230 232
    if ischar(value)
        try
            value = evalin('base', value);
        catch
            error(hdlerrormsgid('invalidValue'), '''%s'' cannot be evaluated.', property);
            % 236 238
        end % try
    end % if
function oName = legalHDLName(this, property, opt)
    % 240 245
    % 241 245
    % 242 245
    % 243 245
    iName = get(this, property);
    % 245 247
    if lt(nargin, 3.0)
        opt = '';
    end % if
    rsvd = strncmpi(opt, 'reserved', numel(opt));
    switch lower(this.TargetLanguage)
    case 'vhdl'
        if rsvd
            oName = vhdllegalnamersvd(iName);
        else
            oName = vhdllegalname(iName);
        end % if
    case 'verilog'
        if rsvd
            oName = veriloglegalnamersvd(iName);
        else
            oName = veriloglegalname(iName);
        end % if
    otherwise
        error(hdlerrormsgid('unsupportedlanguage'), 'Unsupported target Language: %s', this.TargetLanguage);
        % 265 268
        % 266 268
    end % switch
    % 268 270
    if not(strcmp(oName, iName))
        warning(hdlerrormsgid('hdllegalname'), 'Changing ''%s'' to make it a legal HDL name; check the generated code for details.', property);
        % 271 274
        % 272 274
    end % if
function slogicyesno = filterOutputStdlogic(this)
    % 275 278
    % 276 278
    if strcmpi(this.OutputType, 'Same as input type')
        slogicyesno = strcmp(this.InputType, 'std_logic_vector');
    else
        slogicyesno = strcmpi(this.OutputType, 'std_logic_vector');
    end % if
