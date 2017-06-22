function schema
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    pkg = findpackage('slhdlcoder');
    this = schema.class(pkg, 'ScriptGenerator');
    % 9 11
    % 10 11
    if isempty(findtype('HDLTargetLanguage'))
        schema.UserType('HDLTargetLanguage', 'string', @checkHDLTargetLanguage);
        % 13 14
    end % if
    % 15 17
    % 16 17
    schema.prop(this, 'TopLevelName', 'string');
    schema.prop(this, 'TestBenchName', 'string');
    schema.prop(this, 'EntityPathList', 'string vector');
    schema.prop(this, 'EntityNamelist', 'string vector');
    schema.prop(this, 'TargetLanguage', 'HDLTargetLanguage');
    schema.prop(this, 'IsVHDL', 'bool');
    schema.prop(this, 'CodeGenDirectory', 'string');
    % 24 25
    schema.prop(this, 'GenerateCompileDoFile', 'bool');
    schema.prop(this, 'GenerateTBCompileDoFile', 'bool');
    schema.prop(this, 'GenerateSimDoFile', 'bool');
    schema.prop(this, 'GenerateSimProjectFile', 'bool');
    schema.prop(this, 'GenerateSynthesisFile', 'bool');
    schema.prop(this, 'GenerateMapFile', 'bool');
    % 31 32
    schema.prop(this, 'CompileDoFilePostFix', 'string');
    schema.prop(this, 'SimDoFilePostFix', 'string');
    schema.prop(this, 'SimProjectFilePostFix', 'string');
    schema.prop(this, 'SynthesisFilePostFix', 'string');
    schema.prop(this, 'MapFilePostFix', 'string');
    % 37 38
    schema.prop(this, 'HdlCompileInit', 'string');
    schema.prop(this, 'HdlCompileVhdlCmd', 'string');
    schema.prop(this, 'HdlCompileVerilogCmd', 'string');
    schema.prop(this, 'SimulatorFlags', 'string');
    schema.prop(this, 'HdlCompileTerm', 'string');
    schema.prop(this, 'HdlSimInit', 'string');
    schema.prop(this, 'HdlSimCmd', 'string');
    schema.prop(this, 'HdlSimViewWaveCmd', 'string');
    schema.prop(this, 'HdlSimTerm', 'string');
    schema.prop(this, 'HdlSimProjectInit', 'string');
    schema.prop(this, 'HdlSimProjectCmd', 'string');
    schema.prop(this, 'HdlSimprojectTerm', 'string');
    schema.prop(this, 'HdlMapArrow', 'string');
    schema.prop(this, 'HdlSynthInit', 'string');
    schema.prop(this, 'HdlSynthCmd', 'string');
    schema.prop(this, 'HdlMapArrow', 'string');
    schema.prop(this, 'HdlSynthTerm', 'string');
    % 55 57
    % 56 57
    schema.prop(this, 'ScriptGenSuccessful', 'bool');
end % function
function checkHDLTargetLanguage(lang)
    % 60 63
    % 61 63
    % 62 63
    if not(isempty(lang)) && not(strcmpi(lang, 'vhdl')) && not(strcmp(lang, 'verilog'))
        error(hdlcodererrormsgid('invalidhandle'), 'Invalid BlockDiagram handle');
        % 65 66
    end % if
end % function
