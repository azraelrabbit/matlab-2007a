function hdlcode = verilogtbcodercodeinit(this, node, level, nname, fp)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    comment_char = hdlgetparameter('comment_char');
    indentedcomment = horzcat('  ', comment_char, ' ');
    separatorline = horzcat(comment_char, ' ', mtimes('-', ones(1.0, minus(63.0, length(comment_char)))), '\n');
    % 10 11
    hdlcode = hdlcodeinit;
    createdate = datestr(now, 31.0);
    rcs_cvs_tag = hdlgetparameter('rcs_cvs_tag');
    % 14 15
    [pathstr, fname, exten, vers] = fileparts(fullfile(this.CodeGenDirectory, horzcat(this.TestBenchName, this.TBFileNameSuffix)));
    % 16 17
    fp = strrep(pathstr, '\', '\\');
    dispname = strrep(fp, char(10.0), '_');
    % 19 21
    % 20 21
    hdlcode.entity_comment = horzcat(separatorline, comment_char, '\n', comment_char, ' Module: ', nname, '\n', comment_char, ' Simulink Path: ', dispname, '\n', comment_char, ' Created: ', createdate, '\n', comment_char, ' Hierarchy Level:', sprintf(' %d', level), '\n', comment_char, '\n', rcs_cvs_tag, comment_char, '\n', separatorline, hdlannotationcomments(node, level));
    % 22 35
    % 23 35
    % 24 35
    % 25 35
    % 26 35
    % 27 35
    % 28 35
    % 29 35
    % 30 35
    % 31 35
    % 32 35
    % 33 35
    % 34 35
    hdlcode.arch_functions = horzcat(indentedcomment, 'Local Functions\n');
    hdlcode.arch_typedefs = horzcat(indentedcomment, 'Local Type Definitions\n');
    hdlcode.arch_constants = horzcat(indentedcomment, 'Constants\n');
    hdlcode.arch_signals = horzcat(indentedcomment, 'Signals\n');
    hdlcode.arch_body_blocks = horzcat('\n', indentedcomment, 'Block Statements\n');
    hdlcode.arch_body_output_assignments = horzcat(indentedcomment, 'Assignment Statements\n');
    hdlcode.arch_decl = '';
    hdlcode.arch_comment = '';
    hdlcode.arch_end = horzcat('endmodule', indentedcomment, nname, '\n');
    hdlcode.arch_component_decl = '';
    hdlcode.arch_component_config = '';
    hdlcode.arch_begin = '';
    hdlcode.arch_body_component_instances = horzcat('\n', indentedcomment, 'Module Instances\n');
    hdlcode.entity_library = '';
    hdlcode.entity_package = '`timescale 1 ns / 1 ns\n\n';
    hdlcode.entity_decl = horzcat('module ', nname, '; \n\n');
    hdlcode.entity_end = '';
    % 52 53
    thigh = this.ForceClockHighTime;
    tlow = this.ForceClockLowTime;
    tcycle = plus(tlow, thigh);
    thold = this.ForceHoldTime;
    clk = this.ClockName;
    clken = this.ClockEnableName;
    reset = this.ResetName;
    datavalid = this.DataValidName;
    % 61 62
    hdlcode.arch_constants = horzcat(hdlcode.arch_constants, '  parameter ', sprintf('%-32s', horzcat(clk, '_high')), ' = ', num2str(thigh), ';\n', '  parameter ', sprintf('%-32s', horzcat(clk, '_low')), ' = ', num2str(tlow), ';\n', '  parameter ', sprintf('%-32s', horzcat(clk, '_period')), ' = ', num2str(tcycle), ';\n', '  parameter ', sprintf('%-32s', horzcat(clk, '_hold')), ' = ', num2str(thold), ';\n', '  parameter ', sprintf('%-32s', horzcat(clk, '_setup')), ' = ', num2str(thold), ';\n', '  parameter ', sprintf('%-32s', horzcat(clk, '2Q')), ' = ', num2str(thold), ';\n', '  parameter ', sprintf('%-32s', 'delay'), ' = ', num2str(thold), ';\n');
    % 63 77
    % 64 77
    % 65 77
    % 66 77
    % 67 77
    % 68 77
    % 69 77
    % 70 77
    % 71 77
    % 72 77
    % 73 77
    % 74 77
    % 75 77
    % 76 77
end % function
