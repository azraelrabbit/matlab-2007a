function out = getinfo(c)
    % 1 20
    % 2 20
    % 3 20
    % 4 20
    % 5 20
    % 6 20
    % 7 20
    % 8 20
    % 9 20
    % 10 20
    % 11 20
    % 12 20
    % 13 20
    % 14 20
    % 15 20
    % 16 20
    % 17 20
    % 18 20
    out = getprotocomp(c);
    % 20 24
    % 21 24
    % 22 24
    out.Name = xlate('Model Variables');
    out.Type = 'SL';
    out.Desc = xlate('Shows all workspace variables used by a Simulink model.');
    % 26 30
    % 27 30
    % 28 30
    out.att.isWorkspaceIO = logical(0);
    out.att.TableTitle = 'Model Variables';
    % 31 33
    out.att.isBorder = logical(1);
    out.att.isShowParentBlock = logical(1);
    out.att.isShowCallingString = logical(1);
    out.att.isShowVariableSize = logical(0);
    out.att.isShowVariableMemory = logical(0);
    out.att.isShowVariableClass = logical(0);
    out.att.isShowVariableValue = logical(1);
    out.att.isShowTunableProps = logical(0);
    % 40 42
    out.att.ParameterProps = {};
    % 42 46
    % 43 46
    % 44 46
    out.attx.isWorkspaceIO.String = 'Include Workspace I/O parameters';
    % 46 48
    out.attx.TableTitle.String = 'Table title: ';
    % 48 50
    out.attx.TableTitle.isParsedText = 1.0;
    % 50 52
    out.attx.isBorder.String = 'Display table border';
    % 52 54
    out.attx.isShowParentBlock.String = 'Parent block';
    % 54 56
    out.attx.isShowCallingString.String = 'Calling string';
    % 56 58
    out.attx.isShowVariableSize.String = 'Size of variable';
    % 58 60
    out.attx.isShowVariableMemory.String = 'Memory requirements';
    % 60 62
    out.attx.isShowVariableClass.String = 'Class of variable';
    % 62 64
    out.attx.isShowVariableValue.String = 'Value in workspace';
    % 64 66
    out.attx.isShowTunableProps.String = 'RTW storage class';
    % 66 69
    % 67 69
    out.attx.ParameterProps.String = 'Data object parameters';
    % 69 71
    out.attx.ParameterProps.UIcontrol = 'multiedit';
end
